#!/bin/sh

VIMIFIED_PATH=~/.vimified

# Grab the project:
git clone https://github.com/snichme/vimified.git $VIMIFIED_PATH
ln -sfn $VIMIFIED_PATH ~/.vim
ln -sfn $VIMIFIED_PATH/vimrc ~/.vimrc

#Create required directories
mkdir $VIMIFIED_PATH/bundle
mkdir -p $VIMIFIED_PATH/tmp/backup $VIMIFIED_PATH/tmp/swap $VIMIFIED_PATH/tmp/undo

#Set up Vundle
git clone https://github.com/gmarik/vundle.git $VIMIFIED_PATH/bundle/vundle

# Install plugins:
vim +BundleInstall +qall
