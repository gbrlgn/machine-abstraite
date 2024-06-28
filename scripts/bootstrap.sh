#!/bin/sh


sh ./flatpak.sh $1 &

cd $HOME/Documentos/Git

git clone git@github.com:gbrlgn/private.git
git clone git@github.com:gbrlgn/compsci.git
git clone git@github.com:gbrlgn/books.git

distrobox create Ubuntu -i ubuntu:latest
