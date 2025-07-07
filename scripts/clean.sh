#!/bin/sh


if [ $# -ne 0 ]
then
	echo "[sudo] ./clean.sh"
	exit 1
fi

nix-collect-garbage -dKk

flatpak remove --unused
