rpm-ostree upgrade --install acpid akmod-nvidia dbus-devel dbus-glib-devel ffmpeg gnome-tweaks dkms emacs glib2-devel gnome-boxes gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav htop kernel-devel-matched lame libglvnd-devel NetworkManager-tui steam vulkan-headers vulkan-tools xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs xorg-x11-drv-nvidia-libs.x86_64 zsh --allow-inactive

rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1
