# Snichme's Dotfiles

## install

```sh
git clone https://github.com/snichme/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

```sh
./script/bootstrap

sh ./osx/set-defaults.sh

# Install homebrew
sh ./homebrew/install.sh 2>&1

Install applications via homebrew
./script/install

# Update vim packages
vim +BundleInstall +qall



