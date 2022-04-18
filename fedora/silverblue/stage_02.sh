# rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

rpm-ostree install binutils dbus-devel dbus-glib-devel dbus-libs dkms dnf-plugins-core emacs exa fish fontawesome-fonts glib2-devel gnome-tweaks gstreamer1-plugin-openh264 hanazono-fonts htop libtool kernel-devel kernel-devel-matched kernel-headers libglvnd-devel libglvnd-glx libglvnd-opengl linux-firmware make NetworkManager-tui p7zip pciutils powerline-fonts toolbox util-linux-user --allow-inactive

# rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1

flatpak remove org.fedoraproject.MediaWriter org.gnome.Contacts org.gnome.Weather org.gnome.clocks org.gnome.eog org.gnome.Connections org.gnome.Contacts

flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.IntelliJ-IDEA-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.PyCharm-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.vscodium.codium
