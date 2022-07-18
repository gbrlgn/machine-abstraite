#!/bin/sh


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


###########################################################


cp -r $HOME/Documentos/Git/machine-abstraite/config/fish $HOME/.config

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
$HOME/.emacs.d/bin/doom install

cp -r $HOME/Documentos/Git/machine-abstraite/emacs/* $HOME/.emacs.d

cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.emacs.d/* $HOME/.emacs.d


###########################################################


cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.doom.d $HOME
$HOME/.emacs.d/bin/doom sync

cp -r $HOME/Documentos/Git/machine-abstraite/config/fish $HOME/.config

cp -r $HOME/Documentos/Git/machine-abstraite/Wallpapers $HOME/Imagens

cp -r $HOME/Documentos/Git/machine-abstraite/Modelos $HOME
