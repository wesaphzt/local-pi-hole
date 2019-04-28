# local-pi-hole

## Overview

This simple BASH (Linux) script simplifies the process of using Pi-Hole on a single computer.
Useful for trying Pi-Hole out, people who travel, or anyone who doesn't want the hassle of setting up a Raspberry Pi for use across the whole network.

It simply creates a backup of your hosts, grabs the master Pi-Hole blocklist from GitHub and replaces your hosts file with this list.
If you have any custom entries in your hosts file, at the moment these will be lost.

## Using the script

Using the terminal, navigate to the directory where the script is; e.g;
```
cd $HOME/Downloads
```

Make the script executable;
```
chmod +x local-pi-hole.sh
```

The script needs to be run as root to be able to make modifications to the hosts file.

To run the script;
```
sudo ./local-pi-hole.sh
```

## Scheduling

Regular updating of the Pi-Hole blocklist can be scheduled through crontab.

Open the root crontab;
```
sudo crontab -e
```

Add the crontab, e.g;
```
# local-pi-hole
00 18 * * * $HOME/Scripts/local-pi-hole.sh
```

This example will update the blocklist everyday at 6:00pm.

To add logging;
```
# local-pi-hole
00 18 * * * $HOME/Scripts/local-pi-hole.sh >> /var/log/local-pi-hole.cron.log 2>&1
```

Save and exit.

## Improvements

Code improvements and refinements, reporting issues or general suggestions are welcomed, using the issue tracker https://github.com/wesaphzt/local-pi-hole/issues.

## License

This script is distributed under the terms of the GNU General Public License, version 2 or later.

## Tips

If you appreciate this script, feel free to leave a tip;

BTC: 1GCkvAg9oG79niQTbh6EH9rPALQDXKyHKK
