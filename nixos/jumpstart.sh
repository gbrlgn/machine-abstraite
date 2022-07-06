#!/bin/sh

mkdir $HOME/Documentos/Git
cd $HOME/Documentos/Git

git clone https://github.com/gbrlgn/private
git clone https://github.com/gbrlgn/compsci
git clone https://github.com/gbrlgn/books
git clone https://github.com/gbrlgn/machine-abstraite

cd private && git config credential.helper store
cd ../compsci && git config credential.helper store
cd ../books && git config credential.helper store
cd ../machine-abstraite && git config credential.helper store


###########################################################


cp -r $HOME/Documentos/Git/machine-abstraite/config/fish $HOME/.config

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
$HOME/.emacs.d/bin/doom install

cp -r $HOME/Documentos/Git/machine-abstraite/emacs/* $HOME/.emacs.d


###########################################################


cp -r $HOME/Documentos/Git/machine-abstraite/emacs/.doom.d $HOME
$HOME/.emacs.d/bin/doom sync

cp -r $HOME/Documentos/Git/machine-abstraite/config/fish $HOME/.config

cp -r $HOME/Documentos/Git/machine-abstraite/Wallpapers $HOME/Imagens

cp -r $HOME/Documentos/Git/machine-abstraite/Modelos $HOME
