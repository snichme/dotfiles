#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  x You should probably install Homebrew first:"
  echo "    https://github.com/mxcl/homebrew/wiki/installation"
  exit
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install homebrew packages
brew install grc coreutils spark


# Install GNU core utilities (those that come with OS X are outdated)
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php
brew install php55

# Install other useful binaries
brew install ack
#brew install exiv2
brew install git
brew install hub
#brew install imagemagick
brew install node
brew install tree

brew install vim
brew install tmux

brew tap homebrew/versions

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
	brew cask install "${@}" 2> /dev/null
}

installcask dropbox
installcask google-chrome
installcask google-chrome-canary
installcask iterm2
installcask macvim
installcask sublime-text
installcask the-unarchiver
installcask transmission
installcask ukelele
installcask virtualbox
installcask vlc

# Remove outdated versions from the cellar
brew cleanup

exit 0