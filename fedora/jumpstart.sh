git config --global user.name "Gabriel Gian"
git config --global user.email "gabrielgian@protonmail.com"


cd /home/dancer/Documentos/Git

git clone https://github.com/gbrlgian/private
git clone https://github.com/gbrlgian/compsci
git clone https://github.com/gbrlgian/books
git clone https://github.com/gbrlgian/machine-abstraite

cd private && git config credential.helper store
cd ../compsci && git config credential.helper store
cd ../books && git config credential.helper store
cd ../machine-abstraite && git config credential.helper store


###########################################################


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p /home/dancer/.zsh
git clone https://github.com/sindresorhus/pure.git /home/dancer/.zsh/pure

cp /home/dancer/Documentos/Git/machine-abstraite/config/.zshrc /home/dancer

bash <(curl -fksSL https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh)


###########################################################


cp -r /home/dancer/Documentos/Git/machine-abstraite/Wallpapers /home/dancer/Imagens

mkdir /home/dancer/.config/autostart && cp /home/dancer/Documentos/Git/machine-abstraite/config/nvidia-powermizer.desktop /home/dancer/.config/autostart
