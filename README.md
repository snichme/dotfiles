# Snichme's Dotfiles

## install

```sh
git clone https://github.com/snichme/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```
```sh
cp .localrc-example ~/.localrc
```

Edit the .localrc file and add which packages to install

```sh
# install selected packages
config_files=($ZSH/('system'|'osx'|'asd')/*.zsh)
# or to install all
config_files=($ZSH/**/*.zsh)
```

Then run

```sh
./script/bootstrap

sh ./osx/set-defaults.sh

# Install homebrew
sh ./homebrew/install.sh 2>&1

Install applications via homebrew
./script/install

# Update vim packages
vim +BundleInstall +qall



