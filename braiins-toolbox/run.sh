#!/usr/bin/with-contenv bashio
set -e

# Configuration
LOG_LEVEL=$(bashio::config 'log_level')
AUTO_UPDATE=$(bashio::config 'auto_update')
BRAIINS_TOOLBOX_VERSION=${BRAIINS_TOOLBOX_VERSION:-"25.03"}

# Architecture mapping
case "$(bashio::info.arch)" in
    "amd64")
        ARCH="x86_64"
        ;;
    "aarch64")
        ARCH="aarch64"
        ;;
    "armv7")
        ARCH="armv7"
        ;;
    *)
        bashio::log.fatal "Unsupported architecture: $(bashio::info.arch)"
        exit 1
        ;;
esac

bashio::log.info "Starting Braiins Toolbox for architecture: ${ARCH}"

# Download URL
DOWNLOAD_URL="https://downloads.braiins.com/braiins-toolbox/assets/${BRAIINS_TOOLBOX_VERSION}/braiins-toolbox-linux-${ARCH}.tar.gz"
TOOLBOX_DIR="/opt/braiins-toolbox"
BINARY_PATH="${TOOLBOX_DIR}/braiins-toolbox"

# Function to download and extract Braiins Toolbox
download_toolbox() {
    bashio::log.info "Downloading Braiins Toolbox ${BRAIINS_TOOLBOX_VERSION} for ${ARCH}..."
    
    # Create temporary directory
    TEMP_DIR=$(mktemp -d)
    cd "${TEMP_DIR}"
    
    # Download the archive with retry logic
    for i in {1..3}; do
        if curl -L -f --connect-timeout 30 --max-time 300 -o "braiins-toolbox.tar.gz" "${DOWNLOAD_URL}"; then
            bashio::log.info "Download successful"
            break
        else
            bashio::log.warning "Download attempt ${i} failed"
            if [ ${i} -eq 3 ]; then
                bashio::log.fatal "Failed to download Braiins Toolbox from ${DOWNLOAD_URL} after 3 attempts"
                exit 1
            fi
            sleep 5
        fi
    done
    
    # Extract the archive
    if ! tar -xzf "braiins-toolbox.tar.gz"; then
        bashio::log.fatal "Failed to extract Braiins Toolbox archive"
        exit 1
    fi
    
    # Find the binary (it should be in a subdirectory)
    EXTRACTED_BINARY=$(find . -name "braiins-toolbox" -type f | head -1)
    if [ -z "${EXTRACTED_BINARY}" ]; then
        bashio::log.fatal "Could not find braiins-toolbox binary in extracted archive"
        bashio::log.info "Archive contents:"
        find . -type f
        exit 1
    fi
    
    # Copy binary to destination
    cp "${EXTRACTED_BINARY}" "${BINARY_PATH}"
    chmod +x "${BINARY_PATH}"
    
    # Cleanup
    cd /
    rm -rf "${TEMP_DIR}"
    
    bashio::log.info "Braiins Toolbox downloaded and installed successfully"
}

# Check if binary exists and download if needed
if [ ! -f "${BINARY_PATH}" ] || [ "${AUTO_UPDATE}" = "true" ]; then
    download_toolbox
fi

# Verify binary exists and is executable
if [ ! -x "${BINARY_PATH}" ]; then
    bashio::log.fatal "Braiins Toolbox binary not found or not executable at ${BINARY_PATH}"
    exit 1
fi

# Test the binary first
bashio::log.info "Testing Braiins Toolbox binary..."
if ! "${BINARY_PATH}" --help >/dev/null 2>&1; then
    bashio::log.warning "Binary test with --help failed, but continuing anyway..."
fi

# Set log level for Braiins Toolbox (if supported)
export RUST_LOG="${LOG_LEVEL}"

bashio::log.info "Starting Braiins Toolbox..."
bashio::log.info "Web interface will be available on port 8888"

# Start Braiins Toolbox - it runs on localhost:8888 by default
exec "${BINARY_PATH}" -g 0.0.0.0:8888