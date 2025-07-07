#!/bin/sh


if [ $# -ne 1 ]
then
	echo "./flatpak.sh [hettema|pleroma]"
	exit 1
fi

default=$(cat <<- EOT
		org.gtk.Gtk3theme.adw-gtk3-dark
		com.belmoussaoui.Authenticator
		org.gnome.World.Secrets
	EOT
)

if [ "$1" = "hettema" ]
then
	apps=$(cat ./data/hettema)
fi

if [ "$1" = "pleroma" ]
then
	apps=$(cat ./data/hettema ./data/pleroma)
fi

flatpak remote-add --if-not-exists flathub \
	https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub --assumeyes $default $apps
