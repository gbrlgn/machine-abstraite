#!/bin/sh
apt update && apt upgrade

apt install -y awscli binutils pciutils make exa fish p7zip ffmpeg npm htop gnome-music celluloid shotwell linux-firmware gcc make dkms acpid nvidia-driver-510 ubuntu-restricted-extras qt5-style-plugins vulkan-tools openjdk-18-jdk clojure powerline terraform golang rustc elixir fonts-ibm-plex fonts-firacode 


apt remove -y gnome-photos gnome-calendar gnome-system-monitor gnome-clocks gnome-system-monitor gnome-weather gnome-contacts yelp yelp-xsl eog cheese seahorse ubuntu-docs ubuntu-advantage-tools


snap install chromium gimp inkscape spotify onlyoffice-desktopeditors slack teams-insiders
snap install codium --classic
snap install intellij-idea-community --classic


###############################################################################


echo "syzygy" > /etc/hostname
usermod -s /bin/fish gbrlgn


###############################################################################


flatpak upgrade --assumeyes
apt autoremove
snap refresh
passwd -l root