# Braiins Manager Agent

## Overview

Braiins Manager is a powerful tool designed for managing cryptocurrency mining operations, from small and mid-sized setups to industrial-scale operations. This add-on installs the Braiins Manager Agent, which allows you to connect your Home Assistant instance to the Braiins Manager platform.

With this integration, you can remotely manage and monitor your mining hardware through the Braiins Manager platform from anywhere at any time.

## Features

Braiins Manager offers a wide range of features for mining operations:

- **Monitor and Manage**: Oversee hashrate, hashboards, fans, temperature, hardware errors, and get logs. Control machines, change pools, restart miners, and more.
- **Energy Reports**: Receive daily and monthly energy reports for every worker and facility. Never manually deal with energy calculations again.
- **Uptime Monitoring**: Easily monitor the status of your hardware to optimize the uptime of each machine.
- **Sitemap**: Efficiently manage your mining fleet by incorporating it into the sitemap. Gain insights into the location and performance of miners.
- **Triggers & Ticketing**: Set up automated actions based on specific conditions and create/monitor/resolve issues within your fleet.
- **Curtailment**: Take part in various demand response programs and increase your operational profits.

## Installation

1. Navigate to the Home Assistant Add-on Store
2. Add the repository URL: `https://github.com/Donach/bma-agent`
3. Find the "Braiins Manager Agent" add-on and click install
4. Configure the add-on as described below
5. Start the add-on

## Configuration

To use this add-on, you need to sign up for a Braiins Manager account at [manager.braiins.com](https://manager.braiins.com).

After creating your account, you'll need to obtain an Agent ID and Secret Key from the Braiins Manager platform.

```yaml
agent_id: your_agent_id
secret_key: your_secret_key
```

### Option: `agent_id` (required)

This is the unique identifier for your Braiins Manager Agent. You can obtain this from your Braiins Manager account.

### Option: `secret_key` (required)

This is the authentication key for your Braiins Manager Agent. You can obtain this from your Braiins Manager account.

## How to use

1. Sign up for a Braiins Manager account at [braiins.com/manager](https://braiins.com/manager)
2. Create your Agent ID and Secret Key in the Braiins Manager platform
3. Configure the add-on with your credentials
4. Start the add-on
5. Access your mining equipment through the Braiins Manager web interface

## Network Access

The add-on requires access to your local network to discover and communicate with mining devices. It uses the host network to ensure proper connectivity with all your mining equipment.

## Support

- For issues with the add-on itself, please open an issue on GitHub
- For Braiins Manager platform support, contact [Braiins Support](https://help.braiins.com/en/support/tickets/new) or join the [Braiins Telegram community](https://t.me/BraiinsOS)
- For product-related discussions, Braiins offers free one-on-one sessions with their product team

## FAQ

### Is Braiins Manager free to use?

Yes, Braiins Manager offers a free plan. More details at [Braiins Manager](https://braiins.com/manager).

### What mining equipment is supported?

Braiins Manager primarily focuses on Bitcoin miners but also supports altcoin miners such as Icerivers and altcoin Antminers.

### Can I manage multiple mining locations?

Absolutely! Braiins Manager is designed to handle operations across multiple data centers. You can manage, monitor, and configure all your miners from a single platform.

## More Information

For more detailed information about Braiins Manager, visit [Braiins Manager](https://braiins.com/manager).
