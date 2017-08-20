#!/usr/bin/env bash

set -e

echo ''

VIMIFIED_PATH=~/.vimified

install_vimified () {
  echo ''

  rm -rf $VIMIFIED_PATH

  git clone https://github.com/snichme/vimified.git $VIMIFIED_PATH
  ln -sfn $VIMIFIED_PATH ~/.vim
  ln -sfn $VIMIFIED_PATH/vimrc ~/.vimrc

  mkdir $VIMIFIED_PATH/bundle
  mkdir -p $VIMIFIED_PATH/tmp/backup $VIMIFIED_PATH/tmp/swap $VIMIFIED_PATH/tmp/undo

  echo ''

  git clone https://github.com/gmarik/vundle.git $VIMIFIED_PATH/bundle/vundle

  echo ''

  vim +BundleInstall +qall
}

install_vimified 

