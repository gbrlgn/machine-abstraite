dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "fastestmirror=True" >> /etc/dnf/dnf.conf
echo "deltarpm=True" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
echo "excludepkgs=gnome-tour" >> /etc/dnf/dnf.conf


###########################################################


dnf install -y acpid akmod-nvidia binutils clisp dbus-devel dbus-glib-devel dbus-libs dkms dnf-plugins-core elixir epiphany ffmpeg ffmpeg-devel ffmpeg-libs fontawesome-fonts geary ghc glib2-devel gnome-music gnome-tweaks go hanazono-fonts htop ibm-plex-fonts-all java-latest-openjdk java-latest-openjdk-devel kernel-devel kernel-devel-matched kernel-headers libglvnd-devel libglvnd-glx libglvnd-opengl linux-firmware make NetworkManager-tui npm php pip powerline powerline-fonts rust shotwell util-linux-user vim vulkan-headers vulkan-tools xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs xorg-x11-drv-nvidia-libs.x86_64 zsh


dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

dnf install -y lame\* --exclude=lame-devel

dnf group upgrade -y --with-optional Multimedia

dnf remove -y cheese cockpit eog gnome-abrt gnome-clocks gnome-connections gnome-contacts gnome-photos gnome-system-monitor gnome-tour gnome-user-docs gnome-weather mediawriter rhythmbox totem yelp

dnf install -y https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm


flatpak install fedora org.gtk.Gtk3theme.Adwaita-dark 
flatpak install flathub io.github.celluloid_player.Celluloid
flatpak install flathub com.spotify.Client
flatpak install flathub com.vscodium.codium
flatpak install flathub com.github.gi_lom.dialect
flatpak install flathub org.gustavoperedo.FontDownloader
flatpak install flathub org.gnome.Fractal
flatpak install flathub de.haeckerfelix.Fragments
flatpak install flathub org.freedesktop.Sdk.Extension.gcc8
flatpak install fedora org.gnome.Geary
flatpak install fedora org.gimp.GIMP
flatpak install flathub org.freedesktop.Sdk.Extension.golang
flatpak install flathub dev.geopjr.Hashbrown
flatpak install flathub org.freedesktop.Sdk.Extension.haskell
flatpak install fedora org.inkscape.Inkscape
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community
flatpak install flathub io.github.seadve.Kooha
flatpak install flathub org.freedesktop.Sdk.Extension.llvm12
flatpak install flathub fr.romainvigier.MetadataCleaner
flatpak install flathub com.gitlab.newsflash
flatpak install flathub org.freedesktop.Sdk.Extension.node16
flatpak install flathub org.freedesktop.Sdk.Extension.openjdk17
flatpak install fedora org.gnome.PasswordSafe
flatpak install flathub org.freedesktop.Sdk.Extension.php80
flatpak install flathub org.gnome.Podcasts
flatpak install flathub com.jetbrains.PyCharm-Community
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable
flatpak install flathub re.sonny.Tangram
flatpak install flathub com.github.liferooter.textpieces
flatpak install flathub org.freedesktop.Sdk.Extension.toolchain-aarch64
flatpak install flathub com.github.hugolabe.Wike


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


cp -r /home/dancer/Documentos/Git/machine-abstraite/Wallpapers /home/dancer/Imagens

cp /home/dancer/Documentos/Git/machine-abstraite/config/nvidia-powermizer.desktop /home/dancer/.config/autostart


###########################################################


rm /usr/share/applications/java*
rm /usr/share/applications/openjdk*
rm /usr/share/applications/org.gnome.Tour.desktop


###########################################################

dnf upgrade -y
dnf clean all
dnf autoremove
flatpak upgrade

passwd -l root
chown -R dancer /home/dancer
