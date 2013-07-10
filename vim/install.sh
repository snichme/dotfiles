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

#Set up your local configuration via local.vimrc file and choose package you want to use:
#echo "let g:vimified_packages = ['general', 'coding', 'clojure', 'color']" > local.vimrc

ln -sfn $VIMIFIED_PATH/local.vimrc ~/.vim/local.vimrc
ln -sfn $VIMIFIED_PATH/extra.vimrc ~/.vim/extra.vimrc

# Install plugins:
vim +BundleInstall +qall 2>/dev/null