dnf upgrade -y


###########################################################


dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf install -y acpid binutils coreutils dbus-devel dbus-glib-devel dbus-libs dkms dnf-plugins-core emacs exa fish fontawesome-fonts glib2-devel gnome-tweaks hanazono-fonts htop libtool kernel-devel kernel-devel-matched kernel-headers libglvnd-devel libglvnd-glx libglvnd-opengl linux-firmware make NetworkManager-tui p7zip pciutils powerline-fonts toolbox unrar util-linux-user vulkan-headers vulkan-tools

dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

dnf install -y lame\* --exclude=lame-devel

dnf group upgrade -y --with-optional Multimedia

dnf remove -y cheese cockpit eog gnome-abrt gnome-clocks gnome-connections gnome-contacts gnome-photos gnome-system-monitor gnome-tour gnome-user-docs gnome-weather mediawriter rhythmbox totem yelp


###########################################################


echo "pleroma" > /etc/hostname
usermod -s /bin/fish gbrlgn
rm /usr/share/applications/org.gnome.Tour.desktop


###########################################################

flatpak upgrade --assumeyes
dnf autoremove
dnf clean all

passwd -l root
