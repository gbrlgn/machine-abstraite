#!/usr/bin/bash

parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -2GiB
parted /dev/sda -- mkpart primary linux-swap -2GiB 100%
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 3 esp on

mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3

mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

swapon /dev/sda2

nixos-generate-config --root /mnt

mv $(curl -fsSL https://raw.githubusercontent.com/gbrlgian/machine-abstraite/main/nixos/nvidia.nix) /mnt/etc/nixos

nixos-install

curl -fsSL https://raw.githubusercontent.com/gbrlgian/machine-abstraite/main/nixos/reterritorialization.sh /mnt/home/calabar

umount -a

reboot
