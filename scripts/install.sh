#!/bin/sh


if [ $# -ne 1 ]
then
	echo "sudo ./install.sh [keter|chokmah]"
	exit 1
fi

mount -L nixos /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
btrfs subvolume create /mnt/swap
umount /mnt

mount -o \
	subvol=root,compress=zstd,defaults,noatime,nodiscard \
	-L nixos /mnt
mkdir -p /mnt/boot/efi /mnt/{home,nix,swap}
mount -L boot /mnt/boot/efi
mount -o \
	subvol=home,compress=zstd,defaults,noatime,nodiscard \
	-L nixos /mnt/home
mount -o \
	subvol=nix,compress=zstd,defaults,noatime,nodiscard \
	-L nixos /mnt/nix
mount -o \
	subvol=swap,compress=zstd,defaults,noatime,nodiscard \
	-L nixos /mnt/swap
btrfs filesystem mkswapfile --size 2g --uuid clear /mnt/swap/swapfile

if [ "$1" = "chokmah" ]
then
	nixos-install --flake ..#chokmah --root /mnt --no-root-password
	exit 0
fi

if [ "$1" = "keter" ]
then
	nixos-install --flake ..#keter --root /mnt --no-root-password
	exit 0
fi

echo "Invalid argument."
exit 1
