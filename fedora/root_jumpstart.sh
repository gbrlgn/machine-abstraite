echo "fastestmirror=True \
deltarpm=True \
max_parallel_downloads=10 \
excludepkgs=gnome-tour" >> /etc/dnf/dnf.conf

dnf upgrade -y


###########################################################


dnf install -y acpid akmod-nvidia autotools binutils coreutils dbus-devel dbus-glib-devel dbus-libs dkms dnf-plugins-core emacs ffmpeg ffmpeg-devel ffmpeg-libs fontawesome-fonts glib2-devel gnome-tweaks hanazono-fonts htop libtool kernel-devel kernel-devel-matched kernel-headers libglvnd-devel libglvnd-glx libglvnd-opengl linux-firmware make NetworkManager-tui p7zip pciutils powerline-fonts toolbox unrar util-linux-user vulkan-headers vulkan-tools xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs zsh

dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

dnf install -y lame\* --exclude=lame-devel

dnf group upgrade -y --with-optional Multimedia

dnf remove -y cheese cockpit eog gnome-abrt gnome-clocks gnome-connections gnome-contacts gnome-photos gnome-system-monitor gnome-tour gnome-user-docs gnome-weather mediawriter rhythmbox totem yelp


###########################################################


echo "danger" > /etc/hostname
chsh -s /bin/zsh dancer
rm /usr/share/applications/org.gnome.Tour.desktop


###########################################################

flatpak upgrade --assumeyes
dnf autoremove
dnf clean all

passwd -l root
