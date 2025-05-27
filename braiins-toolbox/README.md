# Braiins Toolbox Home Assistant Add-on

![Braiins Toolbox Logo](logo.png)

## About

This Home Assistant add-on provides Braiins Toolbox, a powerful Bitcoin mining farm management software with a web-based interface. The add-on automatically downloads the appropriate Braiins Toolbox binary for your system architecture and provides easy access through Home Assistant.

## Features

- **Automatic Binary Download**: Detects your system architecture and downloads the correct Braiins Toolbox binary
- **Web Interface**: Access the full Braiins Toolbox GUI through your browser
- **Multi-Architecture Support**: Works on amd64, aarch64, and armv7 systems
- **Auto-Update**: Optionally download the latest version on each startup
- **Configurable Port**: Set your preferred port for the web interface

## Installation

1. Add this repository to your Home Assistant add-on store
2. Install the "Braiins Toolbox" add-on
3. Configure the add-on options if needed
4. Start the add-on

## Configuration

```yaml
log_level: info
auto_update: true
```

### Options

- `log_level`: Logging level (debug, info, warning, error)
- `auto_update`: Download latest binary on startup (default: true)

## Usage

1. Start the add-on
2. Wait for the binary to download and the service to start
3. Access the web interface at: `http://homeassistant.local:8888`
4. Use Braiins Toolbox to manage your mining hardware

## Supported Mining Hardware

- Antminer devices with Braiins OS or stock firmware
- Avalon miners (beta support)
- Iceriver miners (basic support)
- WhatsMiner detection

## Network Requirements

This add-on uses `host_network: true` to properly discover and communicate with mining hardware on your local network.

## Version

This add-on tracks the official Braiins Toolbox releases. Current version: **25.03**

## Support

- [Braiins Toolbox Documentation](https://docs.braiins.com/toolbox/)
- [Braiins Community Forum](https://community.braiins.com/)
- [Add-on Issues](https://github.com/Donach/ha-addons/issues)

## License

This add-on is licensed under the MIT License. Braiins Toolbox is proprietary software by Braiins. 