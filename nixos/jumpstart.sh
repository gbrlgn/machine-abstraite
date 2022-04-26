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


###########################################################


cp -r $HOME/Documentos/Git/machine-abstraite/config/fish $HOME/.config

curl -sLO https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh
chmod +x install-emacs-live.sh
sh install-emacs-live.sh
rm install-emacs-live.sh

cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.emacs.d/* $HOME/.emacs.d

cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.live-packs $HOME/

cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.emacs-live.el $HOME/


###########################################################


cp -r $HOME/Documentos/Git/machine-abstraite/Wallpapers $HOME/Imagens