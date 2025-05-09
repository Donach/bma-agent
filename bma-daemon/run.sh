#!/usr/bin/with-contenv bashio
set -e

# Regex to match Debian-style UUID
uuid_regex='^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89ABab][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$'

# Pull from add-on options
AGENT_ID=$(bashio::config 'agent_id')
SECRET_KEY=$(bashio::config 'secret_key')

# Validate
if ! [[ "$AGENT_ID" =~ $uuid_regex ]]; then
  bashio::log.fatal "Agent ID ($AGENT_ID) has invalid format"
fi
if ! [[ "$SECRET_KEY" =~ $uuid_regex ]]; then
  bashio::log.fatal "Secret key ($SECRET_KEY) has invalid format"
fi

# Ensure config directory
mkdir -p /etc/braiins-manager-agent

# Write out daemon.yaml (overwriting any existing)
cat > /etc/braiins-manager-agent/daemon.yaml <<EOF
agent_id: $AGENT_ID
secret_key: $SECRET_KEY
EOF

# Finally launch your daemon
exec /opt/bma-daemon