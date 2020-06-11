#!/usr/bin/env bash

# Installing xcode command line tools
echo "installing xcode command line tools"
xcode-select --install

# Install Homebrew (if not installed)
echo "Installing Homebrew."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed` as gsed
brew install gnu-sed

# Install `wget` with IRI support.
brew install wget --with-iri

# grep
brew install grep

# Install useful binaries.
brew install git

# Installs Casks
brew tap caskroom/cask

## Apps I use
brew cask install google-chrome #Chrome
brew cask install iterm2
brew cask install kap
brew cask install keycastr
brew cask install mongodb-compass
brew cask install slack
brew cask install spotify

# Remove outdated versions from the cellar.
brew cleanup
