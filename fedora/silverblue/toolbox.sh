echo "fastestmirror=True \
	deltarpm=True \
	max_parallel_downloads=10 \
	excludepkgs=gnome-tour" >> /etc/dnf/dnf.conf
	
dnf install -y binutils clisp coreutils cpp dbus-devel dbus-glib-devel dbus-libs dkms dnf-plugins-core elixir ffmpeg ffmpeg-devel ffmpeg-libs fontawesome-fonts gcc ghc glib2-devel go hanazono-fonts htop ibm-plex-fonts-all java-latest-openjdk java-latest-openjdk-devel kernel-devel kernel-devel-matched kernel-headers linux-firmware make neovim NetworkManager-tui npm pkgconfig php pip powerline powerline-fonts rust util-linux-user zsh
