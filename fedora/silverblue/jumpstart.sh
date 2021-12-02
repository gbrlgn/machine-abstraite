flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "fastestmirror=True \
	deltarpm=True \
	max_parallel_downloads=10 \
	excludepkgs=gnome-tour" >> /etc/dnf/dnf.conf


###########################################################


rpm-ostree install -y acpid akmod-nvidia binutils coreutils dbus-devel dbus-glib-devel dbus-libs dkms fontawesome-fonts glib2-devel gstreamer1-* hanazono-fonts htop ibm-plex-fonts-all kernel-devel kernel-devel-matched kernel-headers lame libglvnd-devel libglvnd-glx libglvnd-opengl linux-firmware neovim NetworkManager-tui powerline powerline-fonts steam vulkan-headers vulkan-tools xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-libs.x86_64 zsh

rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1


rpm-ostree uninstall -y cheese cockpit eog gnome-abrt gnome-clocks gnome-connections gnome-contacts gnome-photos gnome-system-monitor gnome-tour gnome-user-docs gnome-weather mediawriter rhythmbox totem yelp


flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark 
flatpak install flathub io.github.celluloid_player.Celluloid
flatpak install flathub com.spotify.Client
flatpak install flathub com.vscodium.codium
flatpak install flathub com.github.gi_lom.dialect
flatpak install flathub org.gustavoperedo.FontDownloader
flatpak install flathub org.gnome.Fractal
flatpak install flathub de.haeckerfelix.Fragments
flatpak install flathub org.freedesktop.Sdk.Extension.gcc8
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.freedesktop.Sdk.Extension.golang
flatpak install flathub dev.geopjr.Hashbrown
flatpak install flathub org.freedesktop.Sdk.Extension.haskell
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community
flatpak install flathub io.github.seadve.Kooha
flatpak install flathub org.freedesktop.Sdk.Extension.llvm12
flatpak install flathub fr.romainvigier.MetadataCleaner
flatpak install flathub org.freedesktop.Sdk.Extension.node16
flatpak install flathub org.freedesktop.Sdk.Extension.openjdk17
flatpak install flathub org.gnome.PasswordSafe
flatpak install flathub org.freedesktop.Sdk.Extension.php80
flatpak install flathub org.gnome.Podcasts
flatpak install flathub com.jetbrains.PyCharm-Community
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable
flatpak install flathub re.sonny.Tangram
flatpak install flathub com.github.liferooter.textpieces
flatpak install flathub org.freedesktop.Sdk.Extension.toolchain-aarch64


flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.IntelliJ-IDEA-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.PyCharm-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.vscodium.codium


flatpak upgrade


###########################################################


echo "danger" > /etc/hostname


###########################################################


sudo -u dancer git config --global user.name "Gabriel Gian"
sudo -u dancer git config --global user.email "gabrielgian@protonmail.com"


git clone https://github.com/gbrlgian/compsci /home/dancer/Documentos/Git/compsci
cd /home/dancer/Documentos/Git/compsci && git config credential.helper store

git clone https://github.com/gbrlgian/books /home/dancer/Documentos/Git/books
cd /home/dancer/Documentos/Git/books && git config credential.helper store

git clone https://github.com/gbrlgian/machine-abstraite /home/dancer/Documentos/Git/machine-abstraite
cd /home/dancer/Documentos/Git/machine-abstraite && git config credential.helper store

git clone https://github.com/gbrlgian/private /home/dancer/Documentos/Git/private
cd /home/dancer/Documentos/Git/private && git config credential.helper store


###########################################################


chsh -s /bin/zsh dancer

sudo -u dancer sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p /home/dancer/.zsh
git clone https://github.com/sindresorhus/pure.git /home/dancer/.zsh/pure

cp /home/dancer/Documentos/Git/machine-abstraite/config/.zshrc /home/dancer


###########################################################


cd /home/dancer/.config

ausearch -c 'hl2_linux' --raw | audit2allow -M hl2linux

semodule -X 300 -i hl2linux.pp


###########################################################


cp -r /home/dancer/Documentos/Git/machine-abstraite/Wallpapers /home/dancer/Imagens

cp /home/dancer/Documentos/Git/machine-abstraite/config/nvidia-powermizer.desktop /home/dancer/.config/autostart


###########################################################


rm /usr/share/applications/org.gnome.Tour.desktop


###########################################################

rpm-ostree upgrade -y
flatpak upgrade

passwd -l root
chown -R dancer /home/dancer
