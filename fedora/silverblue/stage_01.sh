flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark --assumeyes
flatpak install flathub io.github.celluloid_player.Celluloid --assumeyes
flatpak install flathub com.vscodium.codium --assumeyes
flatpak install flathub re.sonny.Commit --assumeyes
flatpak install flathub com.github.gi_lom.dialect --assumeyes
flatpak install flathub org.gustavoperedo.FontDownloader --assumeyes
flatpak install flathub org.gnome.Fractal --assumeyes
flatpak install flathub de.haeckerfelix.Fragments --assumeyes
flatpak install flathub org.gaphor.Gaphor --assumeyes
flatpak install flathub org.gnome.Geary --assumeyes
flatpak install flathub org.gimp.GIMP --assumeyes
flatpak install flathub dev.geopjr.Collision --assumeyes
flatpak install flathub org.inkscape.Inkscape --assumeyes
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community --assumeyes
flatpak install flathub re.sonny.Junction --assumeyes
flatpak install flathub org.libreoffice.LibreOffice --assumeyes
flatpak install flathub fr.romainvigier.MetadataCleaner --assumeyes
flatpak install flathub org.gnome.Music --assumeyes
flatpak install flathub com.gabmus.gfeeds --assumeyes
flatpak install flathub org.gnome.World.Secrets --assumeyes
flatpak install flathub org.gnome.Podcasts --assumeyes
flatpak install flathub com.jetbrains.PyCharm-Community --assumeyes
flatpak install flathub org.gnome.Shotwell --assumeyes
flatpak install flathub com.spotify.Client --assumeyes
flatpak install flathub re.sonny.Tangram --assumeyes
flatpak install flathub com.github.liferooter.textpieces --assumeyes
flatpak install flathub com.github.hugolabe.Wike --assumeyes


###########################################################


curl -sLO https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh
chmod +x install-emacs-live.sh
sh install-emacs-live.sh
rm install-emacs-live.sh


###########################################################


git config --global user.name "Gabriel Gian"
git config --global user.email "gabrielgian@protonmail.com"

mkdir $HOME/Documentos/Git
cd $HOME/Documentos/Git

git clone https://github.com/gbrlgian/private
git clone https://github.com/gbrlgian/compsci
git clone https://github.com/gbrlgian/books
git clone https://github.com/gbrlgian/machine-abstraite

cd private && git config credential.helper store
cd ../compsci && git config credential.helper store
cd ../books && git config credential.helper store
cd ../machine-abstraite && git config credential.helper store

cp -r $HOME/Documentos/Git/machine-abstraite/Wallpapers $HOME/Imagens
cp -r $HOME/Documentos/Git/machine-abstraite/config/fish $HOME/.config
cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.emacs.d/* $HOME/.emacs.d
cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.live-packs $HOME/
cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.emacs-live.el $HOME/
