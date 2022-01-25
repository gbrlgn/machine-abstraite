mkdir /home/dancer/Documentos/Git

git clone https://github.com/gbrlgian/compsci /home/dancer/Documentos/Git/compsci
cd /home/dancer/Documentos/Git/compsci && git config credential.helper store

git clone https://github.com/gbrlgian/books /home/dancer/Documentos/Git/books
cd /home/dancer/Documentos/Git/books && git config credential.helper store

git clone https://github.com/gbrlgian/machine-abstraite /home/dancer/Documentos/Git/machine-abstraite
cd /home/dancer/Documentos/Git/machine-abstraite && git config credential.helper store

git clone https://github.com/gbrlgian/private /home/dancer/Documentos/Git/private
cd /home/dancer/Documentos/Git/private && git config credential.helper store


###########################################################


bash <(curl -fksSL https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh)
rsync -a /home/dancer/Documentos/Git/machine-abstraite/emacs/.* /home/dancer


###########################################################


sudo -u dancer sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p /home/dancer/.zsh
git clone https://github.com/sindresorhus/pure.git /home/dancer/.zsh/pure

cp /home/dancer/Documentos/Git/machine-abstraite/config/.zshrc /home/dancer


###########################################################


cp -r /home/dancer/Documentos/Git/machine-abstraite/Wallpapers /home/dancer/Imagens

mkdir -p /home/dancer/.config/autostart

cp /home/dancer/Documentos/Git/machine-abstraite/config/nvidia-powermizer.desktop /home/dancer/.config/autostart


###########################################################


chown -R dancer /home/dancer
passwd dancer
passwd -l root
flatpak upgrade
nix-channel --update
nixos-rebuild switch
