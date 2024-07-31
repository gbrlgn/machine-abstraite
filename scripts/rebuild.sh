#!/bin/sh


if [ $# -ne 1 ]
then
	echo "[sudo] ./rebuild.sh [local|remote]"
	exit 1
fi

if [ "$1" = "local" ]
then
	nixos-rebuild switch --flake .#$(hostname)
	exit 0
fi

if [ "$1" = "remote" ]
then
	nixos-rebuild switch --flake github:gbrlgn/machine-abstraite/main#$(hostname)
	exit 0
fi

echo "Invalid argument."
exit 1
