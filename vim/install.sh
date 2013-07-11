#!/usr/bin/env bash

set -e

echo ''

VIMIFIED_PATH=~/.vimified

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

install_vimified () {
  echo ''

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


if [ -f $VIMIFIED_PATH ] || [ -d $VIMIFIED_PATH ]
then
  overwrite=false
  backup=false
  skip=false
  user "Vimified folder already exists, what do you want to do? [s]kip, [o]verwrite, [b]ackup?"
  read -n 1 action
  case "$action" in
    o )
      overwrite=true;;
    b )
      backup=true;;
    s )
      skip=true;;
    * )
    ;;
  esac

  if [ "$overwrite" == "true" ]
  then
    rm -rf $VIMIFIED_PATH
  fi

  if [ "$backup" == "true" ]
  then
    mv $VIMIFIED_PATH $VIMIFIED_PATH\.backup
  fi

  if [ "$skip" == "false" ]
  then
    install_vimified $source $dest
  fi

else
  install_vimified $source $dest
fi

