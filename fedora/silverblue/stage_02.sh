rpm-ostree install acpid akmod-nvidia dbus-devel dbus-glib-devel gnome-tweaks dkms emacs glib2-devel htop kernel-devel-matched lame libglvnd-devel NetworkManager-tui vulkan-headers vulkan-tools winetricks xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs xorg-x11-drv-nvidia-libs.x86_64 zsh

rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1
