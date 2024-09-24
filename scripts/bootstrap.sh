#!/bin/sh


if [ $# -ne 1 ]
then
	echo "./bootstrap.sh [hettema|pleroma]"
	exit 1
fi

FLASH_PATH=/run/media/$(whoami)/gbrlgn

cp $FLASH_PATH/.ssh/$(hostname)* $HOME/.ssh && \
  chmod 600 $HOME/.ssh/$(hostname)
cp $FLASH_PATH/.ssh/known* $HOME/.ssh && \
  chmod 700 $HOME/.ssh/known*
ssh-add $HOME/.ssh/$(hostname)

cp $FLASH_PATH/private $HOME/Documentos/Git
cp $FLASH_PATH/machine-abstraite $HOME/Documentos/Git
cd $HOME/Documentos/Git/private && git pull &
cd $HOME/Documentos/Git/machine-abstraite && git pull &

ln -ls /bin/bash /run/current-system/sw/bin/bash

sh ./flatpak.sh $1
