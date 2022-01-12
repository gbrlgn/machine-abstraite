dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "fastestmirror=True" >> /etc/dnf/dnf.conf
echo "deltarpm=True" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
echo "excludepkgs=gnome-tour" >> /etc/dnf/dnf.conf


###########################################################


dnf install -y acpid akmod-nvidia binutils dbus-devel dbus-glib-devel dbus-libs dkms dnf-plugins-core emacs ffmpeg ffmpeg-devel ffmpeg-libs fontawesome-fonts glib2-devel gnome-tweaks hanazono-fonts htop kernel-devel kernel-devel-matched kernel-headers libglvnd-devel libglvnd-glx libglvnd-opengl linux-firmware make NetworkManager-tui powerline-fonts toolbox util-linux-user vulkan-headers vulkan-tools xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs xorg-x11-drv-nvidia-libs.x86_64 zsh

dnf install -y https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

dnf install -y lame\* --exclude=lame-devel

dnf group upgrade -y --with-optional Multimedia

dnf remove -y cheese cockpit eog gnome-abrt gnome-clocks gnome-connections gnome-contacts gnome-photos gnome-system-monitor gnome-tour gnome-user-docs gnome-weather mediawriter rhythmbox totem yelp


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

echo "export ZSH=\"/home/dancer/.oh-my-zsh\"" > /home/dancer/.zshrc
echo "ZSH_THEME=\"\"" >> /home/dancer/.zshrc
echo "plugins=(git)" >> /home/dancer/.zshrc
echo "source $ZSH/oh-my-zsh.sh" >> /home/dancer/.zshrc
echo "fpath+=/home/dancer/.zsh/pure" >> /home/dancer/.zshrc
echo "autoload -U promptinit; promptinit" >> /home/dancer/.zshrc
echo "prompt pure" >> /home/dancer/.zshrc


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

passwd -l root
chown -R dancer /home/dancer
