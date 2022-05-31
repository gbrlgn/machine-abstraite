#!/bin/sh
apt update && apt upgrade

apt install -y acpid awscli binutils celluloid clojure dkms docker-compose elixir exa ffmpeg fish fonts-firacode fonts-ibm-plex gcc golang htop linux-firmware make mesa-vulkan-drivers make npm nvidia-driver-510 openjdk-18-jdk p7zip pciutils powerline qt5-style-plugins rustc shotwell ubuntu-restricted-extras vulkan-headers vulkan-tools vulkan-utils


apt remove -y gnome-photos gnome-system-monitor gnome-clocks gnome-system-monitor gnome-weather gnome-contacts yelp yelp-xsl eog cheese seahorse ubuntu-docs ubuntu-advantage-tools


snap install chromium gimp inkscape onlyoffice-desktopeditors spotify  slack teams-insiders
snap install codium --classic
snap install intellij-idea-community --classic
snap install pycharm-community --classic


###############################################################################


echo "syzygy" > /etc/hostname
usermod -s /bin/fish gbrlgn

sh -c "echo 'export QT_QPA_PLATFORMTHEME=gtk3' >> /etc/environment"

###############################################################################


flatpak upgrade --assumeyes
apt autoremove
snap refresh
passwd -l root
