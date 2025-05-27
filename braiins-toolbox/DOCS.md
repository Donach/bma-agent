# Home Assistant Add-on: Braiins Toolbox

Braiins Toolbox is a powerful Bitcoin mining farm management software that provides a web-based interface for managing and monitoring your mining hardware at scale. This add-on automatically downloads and runs the latest Braiins Toolbox binary, providing you with a comprehensive solution for managing your mining operations.

## About

Braiins Toolbox offers:

- **Web-based GUI**: Modern, intuitive interface accessible through your browser
- **Multi-miner support**: Manage various ASIC miners including Antminer, Avalon, and Iceriver
- **Batch operations**: Perform actions on multiple miners simultaneously
- **Network scanning**: Discover miners on your network automatically
- **Firmware management**: Install, upgrade, and manage Braiins OS+ firmware
- **Pool configuration**: Configure mining pools across multiple devices
- **Performance monitoring**: Monitor hashrate, temperature, and power consumption
- **Remote management**: Pause, resume, reboot, and configure miners remotely

## Installation

1. Navigate in your Home Assistant frontend to **Settings** → **Add-ons** → **Add-on Store**.
2. Add this repository URL: `https://github.com/Donach/ha-addons`
3. Find the "Braiins Toolbox" add-on and click it.
4. Click on the "INSTALL" button.

## How to use

1. Start the add-on.
2. Check the add-on log output to see the result.
3. Access the Braiins Toolbox web interface at: `http://homeassistant.local:8888`
   - Or use your Home Assistant IP: `http://YOUR_HA_IP:8888`

## Configuration

Add-on configuration:

```yaml
web_port: 8888
log_level: info
auto_update: true
```

### Option: `web_port` (required)

The port on which the Braiins Toolbox web interface will be available.

**Default**: `8888`

### Option: `log_level` (required)

Controls the level of log output.

**Default**: `info`

**Options**:
- `debug`: Very verbose logging
- `info`: Normal logging
- `warning`: Only warnings and errors
- `error`: Only errors

### Option: `auto_update` (required)

When enabled, the add-on will automatically download the latest Braiins Toolbox binary on startup.

**Default**: `true`

## Network Requirements

This add-on requires `host_network: true` to properly discover and communicate with mining hardware on your local network. The web interface will be accessible on the configured port.

## Architecture Support

This add-on supports the following architectures:

- `amd64` (Intel/AMD 64-bit)
- `aarch64` (ARM 64-bit)
- `armv7` (ARM 32-bit)

The appropriate binary will be automatically downloaded based on your system's architecture.

## Changelog & Releases

This add-on follows the versioning of Braiins Toolbox releases. The current version includes:

- **Version 25.03**: Latest release with Avalon miner support, DPS boost mode, and improved CSV export functionality
- Automatic binary download and architecture detection
- Web interface on configurable port
- Auto-update capability

## Support

Got questions? Please check:

- [Braiins Toolbox Documentation](https://docs.braiins.com/toolbox/)
- [Braiins Community Forum](https://community.braiins.com/)
- [GitHub Issues](https://github.com/Donach/ha-addons/issues)

## License

MIT License - see the [LICENSE](https://github.com/Donach/ha-addons/blob/main/LICENSE) file for details.

## Authors & Contributors

- **Donach** - *Initial work* - [Donach](https://github.com/Donach)

This add-on is not officially supported by Braiins. It's a community-maintained integration that downloads and runs the official Braiins Toolbox software. 