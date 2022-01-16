flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark --assumeyes
flatpak install flathub io.github.celluloid_player.Celluloid --assumeyes
flatpak install flathub com.vscodium.codium --assumeyes
flatpak install flathub re.sonny.Commit --assumeyes
flatpak install flathub com.github.gi_lom.dialect --assumeyes
flatpak install flathub org.gustavoperedo.FontDownloader --assumeyes
flatpak install flathub org.gnome.Fractal --assumeyes
flatpak install flathub de.haeckerfelix.Fragments --assumeyes
flatpak install flathub org.gaphor.Gaphor --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.gcc8 --assumeyes
flatpak install fedora org.gnome.Geary --assumeyes
flatpak install flathub org.gimp.GIMP --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.golang --assumeyes
flatpak install flathub dev.geopjr.Hashbrown --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.haskell --assumeyes
flatpak install flathub org.inkscape.Inkscape --assumeyes
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community --assumeyes
flatpak install flathub re.sonny.Junction --assumeyes
flatpak install fedora org.libreoffice.LibreOffice --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.llvm12 --assumeyes
flatpak install flathub fr.romainvigier.MetadataCleaner --assumeyes
flatpak install fedora org.gnome.Music --assumeyes
flatpak install flathub com.gitlab.newsflash --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.node16 --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.openjdk17 --assumeyes
flatpak install flathub org.gnome.PasswordSafe --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.php80 --assumeyes
flatpak install flathub org.gnome.Podcasts --assumeyes
flatpak install flathub com.jetbrains.PyCharm-Community --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable --assumeyes
flatpak install fedora org.gnome.Shotwell --assumeyes
flatpak install flathub com.spotify.Client --assumeyes
flatpak install flathub re.sonny.Tangram --assumeyes
flatpak install flathub com.github.liferooter.textpieces --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.toolchain-aarch64 --assumeyes
flatpak install flathub com.github.hugolabe.Wike --assumeyes


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
