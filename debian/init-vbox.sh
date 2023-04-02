#!/usr/bin/env bash
set -euo pipefail

if [ "$(whoami)" != "root" ]; then
    echo "This scripts needs to be run as root"
    exit 1
fi

passwd vagrant << EOD
vagrant
vagrant
EOD
mount /dev/cdrom /mnt
sh /mnt/VBoxLinuxAdditions.run
unmount /mnt
