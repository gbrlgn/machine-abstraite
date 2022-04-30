apt update && apt upgrade

apt install -y binutils pciutils exa fish p7zip ffmpeg npm htop gnome-music celluloid shotwell linux-firmware gcc make dkms acpid nvidia-driver-470 ubuntu-restricted-extras qt5-style-plugins vulkan-tools powerline golang rustc elixir fonts-ibm-plex


apt remove -y gnome-photos gnome-calendar gnome-system-monitor gnome-clocks gnome-system-monitor gnome-weather gnome-contacts yelp yelp-xsl eog cheese seahorse ubuntu-docs ubuntu-advantage-tools


snap install gimp inkscape spotify libreoffice
snap install codium --classic
snap install intellij-idea-community --classic


echo "syzygy" > /etc/hostname
usermod -s /bin/fish gbrlgn


flatpak upgrade --assumeyes
apt autoremove
snap refresh
passwd -l root
