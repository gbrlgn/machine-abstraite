#!/bin/sh


if [ $1 = "local" ]
then
	nixos-rebuild switch --flake .#$(hostname)
fi

if [ $1 = "remote" ]
then
	nixos-rebuild switch --flake github:gbrlgn/machine-abstraite/main#$(hostname)
fi

