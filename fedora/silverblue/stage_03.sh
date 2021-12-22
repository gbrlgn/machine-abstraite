flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark 
flatpak install flathub io.github.celluloid_player.Celluloid
flatpak install flathub com.vscodium.codium
flatpak install flathub re.sonny.Commit
flatpak install flathub com.github.gi_lom.dialect
flatpak install flathub org.gustavoperedo.FontDownloader
flatpak install flathub org.gnome.Fractal
flatpak install flathub de.haeckerfelix.Fragments
flatpak install flathub org.gaphor.Gaphor
flatpak install flathub org.freedesktop.Sdk.Extension.gcc8
flatpak install fedora org.gnome.Geary
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.freedesktop.Sdk.Extension.golang
flatpak install flathub dev.geopjr.Hashbrown
flatpak install flathub org.freedesktop.Sdk.Extension.haskell
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community
flatpak install flathub re.sonny.Junction
flatpak install flathub io.github.seadve.Kooha
flatpak install fedora org.libreoffice.LibreOffice
flatpak install flathub org.freedesktop.Sdk.Extension.llvm12
flatpak install flathub fr.romainvigier.MetadataCleaner
flatpak install fedora org.gnome.Music
flatpak install flathub com.gitlab.newsflash
flatpak install flathub org.freedesktop.Sdk.Extension.node16
flatpak install flathub org.freedesktop.Sdk.Extension.openjdk17
flatpak install flathub org.gnome.PasswordSafe
flatpak install flathub org.freedesktop.Sdk.Extension.php80
flatpak install flathub org.gnome.Podcasts
flatpak install flathub com.jetbrains.PyCharm-Community
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable
flatpak install fedora org.gnome.Shotwell
flatpak install flathub com.spotify.Client
flatpak install flathub re.sonny.Tangram
flatpak install flathub com.github.liferooter.textpieces
flatpak install flathub org.freedesktop.Sdk.Extension.toolchain-aarch64
flatpak install flathub com.github.hugolabe.Wike


flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.IntelliJ-IDEA-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.PyCharm-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.vscodium.codium


###########################################################


echo "danger" > /etc/hostname


###########################################################


sudo -u dancer git config --global user.name "Gabriel Gian"
sudo -u dancer git config --global user.email "gabrielgian@protonmail.com"


mkdir /var/home/dancer/Documentos/Git

git clone https://github.com/gbrlgian/compsci /var/home/dancer/Documentos/Git/compsci
cd /var/home/dancer/Documentos/Git/compsci && git config credential.helper store

git clone https://github.com/gbrlgian/books /var/home/dancer/Documentos/Git/books
cd /var/home/dancer/Documentos/Git/books && git config credential.helper store

git clone https://github.com/gbrlgian/machine-abstraite /var/home/dancer/Documentos/Git/machine-abstraite
cd /var/home/dancer/Documentos/Git/machine-abstraite && git config credential.helper store

git clone https://github.com/gbrlgian/private /var/home/dancer/Documentos/Git/private
cd /var/home/dancer/Documentos/Git/private && git config credential.helper store


###########################################################


chsh -s /bin/zsh dancer

sudo -u dancer sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p /var/home/dancer/.zsh
git clone https://github.com/sindresorhus/pure.git /var/home/dancer/.zsh/pure

cp /var/home/dancer/Documentos/Git/machine-abstraite/config/.zshrc /var/home/dancer


###########################################################


cp -r /var/home/dancer/Documentos/Git/machine-abstraite/Wallpapers /var/home/dancer/Imagens

mkdir -r /var/home/dancer/.config/autostart

cp /var/home/dancer/Documentos/Git/machine-abstraite/config/nvidia-powermizer.desktop /var/home/dancer/.config/autostart


###########################################################


rm /usr/share/applications/org.gnome.Tour.desktop


###########################################################


passwd -l root
chown -R dancer /var/home/dancer


rpm-ostree upgrade
flatpak upgrade
systemctl reboot
