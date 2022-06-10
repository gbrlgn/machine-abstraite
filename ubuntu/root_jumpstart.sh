#!/bin/sh
apt update && apt upgrade

apt install -y acpid awscli binutils cargo celluloid clojure curl dkms elixir fd-find ffmpeg fish fonts-firacode fonts-ibm-plex gcc golang htop kotlin linux-firmware make mesa-vulkan-drivers make npm nvidia-driver-510 openjdk-18-jdk p7zip pciutils pip powerline qt5-style-plugins ripgrep rust-all shotwell ubuntu-restricted-extras vulkan-tools


apt remove -y gnome-photos gnome-system-monitor gnome-clocks gnome-system-monitor gnome-weather gnome-contacts yelp yelp-xsl eog cheese seahorse ubuntu-docs ubuntu-advantage-tools


snap install chromium onlyoffice-desktopeditors spotify  slack teams-insiders
snap install emacs --classic
snap install codium --classic
snap install intellij-idea-community --classic
snap install pycharm-community --classic


###############################################################################


echo "syzygy" > /etc/hostname
usermod -s /bin/fish gbrlgn

sh -c "echo 'export QT_QPA_PLATFORMTHEME=gtk3' >> /etc/environment"


###############################################################################


cargo install exa
mv $HOME/.cargo/exa /usr/bin


###############################################################################


flatpak upgrade --assumeyes
apt autoremove
snap refresh
passwd -l root
