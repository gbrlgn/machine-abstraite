#!/usr/bin/bash

echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

echo "
    SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="gsettings set org.gnome.desktop.interface enable-animations false"
    SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+="gsettings set org.gnome.desktop.interface enable-animations true"
" >> /etc/udev/rules.d/gnome-animations.rules

mkdir /home/calabar/Documentos/Git
git clone https://github.com/gbrlgian/private /home/calabar/Documentos/Git/
git clone https://github.com/gbrlgian/compsci /home/calabar/Documentos/Git/
git clone https://github.com/gbrlgian/books /home/calabar/Documentos/Git/
git clone https://github.com/gbrlgian/machine-abstraite /home/calabar/Documentos/Git/

cp /home/calabar/Documentos/machine-abstraite/Wallpapers /home/calabar/Imagens/

cp /home/calabar/Documentos/machine-abstraite/nixos/dotfiles/vscode/extensions/inconfidente /home/calabar/.vscode-oss

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.gnome.Fractal
flatpak install flathub de.haeckerfelix.Fragments
flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark

./home/calabar/Documentos/Git/machine-abstraite/nixos/terminal-color.sh