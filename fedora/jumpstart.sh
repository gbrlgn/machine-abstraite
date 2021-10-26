dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


###########################################################


dnf install -y acpid clisp dbus-devel dbus-glib-devel dbus-libs	dkms elixir fontawesome-fonts gcc geary ghc gimp glib2-devel gnome-extensions-app gnome-music gnome-tweaks go hanazono-fonts htop ibm-plex-fonts-all keepassxc kernel-devel kernel-headers libglvnd-devel libglvnd-glx libglvnd-opengl linux-firmware make npm nvidia-drivers pkgconfig php powerline powerline-fonts rust shotwell util-linux-user vim vim-powerline vulkan-headers vulkan-tools zsh     


dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

dnf install -y lame\* --exclude=lame-devel

dnf group upgrade --with-optional Multimedia

dnf remove -y cheese cockpit eog gnome-abrt gnome-calendar gnome-clocks gnome-connections gnome-contacts gnome-maps gnome-photos gnome-tour gnome-system-monitor gnome-weather	mediawriter rhythmbox yelp    


flatpak install flathub org.gimp.GIMP
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub org.gnome.Fractal
flatpak install flathub com.spotify.Client
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub de.haeckerfelix.Fragments


rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" | tee -a /etc/yum.repos.d/vscodium.repo

dnf install codium
codium


###########################################################


echo "00000" > /etc/hostname
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
dracut -f


###########################################################


git config --global user.name "Gabriel Gian"
git config --global user.email "gabrielgian@protonmail.com"

git clone https://github.com/gbrlgian/compsci /home/calabar/Documentos/Git/compsci
git clone https://github.com/gbrlgian/books /home/calabar/Documentos/Git/books
it clone https://github.com/gbrlgian/compsci /home/calabar/Documentos/Git/machine-abstraite
git clone https://github.com/gbrlgian/private /home/calabar/Documentos/Git/private


###########################################################


chsh -s /bin/zsh calabar

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p /home/calabar/.zsh
git clone https://github.com/sindresorhus/pure.git /home/calabar/.zsh/pure

cp /home/calabar/Documentos/Git/machine-abstraite/config/zsh/.zshrc /home/calabar/

git clone https://github.com/VundleVim/Vundle.vim.git /home/calabar/.vim/bundle/Vundle.vim

cp /home/calabar/Documentos/Git/machine-abstraite/config/.vimrc /home/calabar
vim -c PluginInstall -c q!


###########################################################


pkill codium

cp -r /home/calabar/Documentos/Git/machine-abstraite/inconfidente/vscode/inconfidente-vsc /home/calabar/.vscode-oss/extensions


###########################################################


cp -r /home/calabar/Documentos/Git/machine-abstraite/Wallpapers /home/calabar/Imagens

cp /home/calabar/Documentos/Git/machine-abstraite/config/desktop/nvidia-powermizer.desktop /home/calabar/.config/autostart/

sh -c /home/calabar/Documentos/Git/machine-abstraite/inconfidente/terminal-color.sh


###########################################################

dnf clean all
chown -R calabar /home/calabar/
