dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


dnf install -y vim zsh npm htop gimp inkscape keepassxc gnome-extensions-app geary shotwell gnome-music dbus-devel dbus-glib-devel dbus-libs gnome-tweaks glib2-devel linux-firmware kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig util-linux-user nvidia-drivers vulkan-tools vulkan-headers powerline powerline-fonts vim-powerline fontawesome-fonts hanazono-fonts go elixir php clisp rust ghc 

dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
dnf install -y lame\* --exclude=lame-devel
dnf group upgrade --with-optional Multimedia

dnf remove -y mediawriter gnome-photos gnome-calendar gnome-connections gnome-system-monitor gnome-tour gnome-clocks gnome-maps gnome-weather gnome-contacts gnome-abrt yelp eog cheese rhythmbox cockpit

flatpak install gimp inkscape
flatpak install flathub org.gnome.Fractal
flatpak install flathub com.spotify.Client
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub de.haeckerfelix.Fragments


rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" | tee -a /etc/yum.repos.d/vscodium.repo
dnf install codium
codium


echo "00000" > /etc/hostname


git config --global user.name "Gabriel Gian"
git config --global user.email "gabrielgian@protonmail.com"

git clone https://github.com/gbrlgian/compsci /home/calabar/Documentos/Git/compsci
git clone https://github.com/gbrlgian/books /home/calabar/Documentos/Git/books
git clone https://github.com/gbrlgian/private /home/calabar/Documentos/Git/private


chsh -s /bin/zsh calabar
mkdir -p /home/calabar/.zsh


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/calabar/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp /home/calabar/Documentos/Git/private/linux/config/zsh/.zshrc /home/calabar/
git clone https://github.com/sindresorhus/pure.git /home/calabar/.zsh/pure

cp -r /home/calabar/Documentos/Git/private/linux/Wallpapers /home/calabar/Imagens

git clone https://github.com/VundleVim/Vundle.vim.git /home/calabar/.vim/bundle/Vundle.vim
cp /home/calabar/Documentos/Git/private/linux/config/.vimrc /home/calabar
vim -c PluginInstall -c q!

pkill codium

dnf clean all

echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
dracut -f

cp -r /home/calabar/Documentos/Git/private/inconfidente/inconfidente-vscode /home/calabar/.vscode-oss/extensions
cp -r /home/calabar/Documentos/Git/private/linux/Wallpapers /home/calabar/Imagens

chown -R calabar /home/calabar/
