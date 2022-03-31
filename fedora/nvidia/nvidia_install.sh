#!/bin/sh

echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

dnf install x11-drv-nvidia akmod-nvidia

akmods --force
dracut --force
