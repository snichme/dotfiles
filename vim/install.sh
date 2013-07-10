#!/bin/sh

# Grab the project:
cd
git clone git://github.com/snichme/vimified.git ~/.vimified
ln -sfn ~/.vimified ~/.vim
ln -sfn ~/.vimified/vimrc ~/.vimrc
cd ~/.vimified

#Create required directories
mkdir bundle
mkdir -p tmp/backup tmp/swap tmp/undo

#Set up Vundle
git clone https://github.com/gmarik/vundle.git bundle/vundle

#Set up your local configuration via local.vimrc file and choose package you want to use:
#echo "let g:vimified_packages = ['general', 'coding', 'clojure', 'color']" > local.vimrc

ln -sfn local.vimrc ~/.vim/local.vimrc
ln -sfn extra.vimrc ~/.vim/extra.vimrc


# Install plugins:
vim +BundleInstall +qall