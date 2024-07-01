#!/bin/sh


mount -L root /mnt
mkdir -p /mnt/boot/efi
mount -L boot /mnt/boot/efi

if [ $1 = "keter" ]
then
	nixos-install --flake ..#keter --root /mnt --no-root-password
fi

if [ $1 = "chokmah" ]
then
	nixos-install --flake ..#chokmah --root /mnt --no-root-password
fi

