dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "fastestmirror=True" >> /etc/dnf/dnf.conf
echo "deltarpm=True" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
echo "excludepkgs=gnome-tour" >> /etc/dnf/dnf.conf


###########################################################


dnf install -y acpid akmod-nvidia clisp dbus-devel dbus-glib-devel dbus-libs dkms dnf-plugins-core elixir fontawesome-fonts gcc geary ghc glib2-devel gnome-extensions-app gnome-music gnome-tweaks go hanazono-fonts htop ibm-plex-fonts-all java-latest-openjdk java-latest-openjdk-devel keepassxc kernel-devel kernel-headers libglvnd-devel libglvnd-glx libglvnd-opengl linux-firmware make npm pkgconfig php pip powerline powerline-fonts rust shotwell util-linux-user neovim vulkan-headers vulkan-tools xorg-x11-drv-nvidia-cuda zsh


dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

dnf install -y lame\* --exclude=lame-devel

dnf group upgrade --with-optional Multimedia

dnf remove -y cheese cockpit eog gnome-abrt gnome-calendar gnome-clocks gnome-connections gnome-contacts gnome-maps gnome-photos gnome-system-monitor gnome-tour gnome-user-docs gnome-weather	mediawriter rhythmbox yelp    

flatpak install flathub com.spotify.Client
flatpak install flathub com.vscodium.codium
flatpak install flathub org.gnome.Fractal
flatpak install flathub de.haeckerfelix.Fragments
flatpak install flathub org.freedesktop.Sdk.Extension.gcc8
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.freedesktop.Sdk.Extension.golang
flatpak install flathub org.freedesktop.Sdk.Extension.haskell
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community
flatpak install flathub org.freedesktop.Sdk.Extension.llvm12
flatpak install flathub org.freedesktop.Sdk.Extension.node16
flatpak install flathub org.freedesktop.Sdk.Extension.openjdk17
flatpak install flathub com.jetbrains.PyCharm-Community
flatpak install flathub org.freedesktop.Sdk.Extension.php80
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub org.freedesktop.Sdk.Extension.toolchain-aarch64


flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.IntelliJ-IDEA-Community

flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.PyCharm-Community

flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.vscodium.codium


###########################################################


curl -o /home/danger/Documentos/NVIDIA-Linux-x86_64-495.44.run -L https://us.download.nvidia.com/XFree86/Linux-x86_64/495.44/NVIDIA-Linux-x86_64-495.44.run

systemctl set-default multi-user.target

bash /home/danger/Documentos/NVIDIA-Linux-*.run

systemctl set-default graphical.target


###########################################################


echo "dancer" > /etc/hostname
echo "blacklist nouveau \
	options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
dracut -v -f


###########################################################


git config --global user.name "Gabriel Gian"
git config --global user.email "gabrielgian@protonmail.com"


git clone https://github.com/gbrlgian/compsci /home/danger/Documentos/Git/compsci
cd /home/danger/Documentos/Git/compsci && git config credential.helper store

git clone https://github.com/gbrlgian/books /home/danger/Documentos/Git/books
cd /home/danger/Documentos/Git/books && git config credential.helper store

git clone https://github.com/gbrlgian/compsci /home/danger/Documentos/Git/machine-abstraite
cd /home/danger/Documentos/Git/machine-abstraite && git config credential.helper store

git clone https://github.com/gbrlgian/private /home/danger/Documentos/Git/private
cd /home/danger/Documentos/Git/private && git config credential.helper store


###########################################################


chsh -s /bin/zsh danger

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p /home/danger/.zsh
git clone https://github.com/sindresorhus/pure.git /home/danger/.zsh/pure

cp /home/danger/Documentos/Git/machine-abstraite/config/zsh/.zshrc /home/danger/

git clone https://github.com/VundleVim/Vundle.vim.git /home/danger/.vim/bundle/Vundle.vim

cp /home/danger/Documentos/Git/machine-abstraite/config/.vimrc /home/danger
vim -c PluginInstall -c q!


###########################################################


# pkill codium

# cp -r /home/danger/Documentos/Git/machine-abstraite/inconfidente/vscode/inconfidente-vsc /home/danger/.vscode-oss/extensions


###########################################################


cp -r /home/danger/Documentos/Git/machine-abstraite/Wallpapers /home/danger/Imagens

cp /home/danger/Documentos/Git/machine-abstraite/config/desktop/nvidia-powermizer.desktop /home/danger/.config/autostart/

sh -c /home/danger/Documentos/Git/machine-abstraite/inconfidente/terminal-color.sh


###########################################################

passwd -l root
dnf clean all
chown -R danger /home/danger

reboot
