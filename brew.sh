#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install all the requirements
brew install vim --with-override-system-vi
brew install neovim
brew install tmux
brew install bat
brew install git
brew install tig
brew install zsh
brew install universal-ctags
brew install the_silver_searcher
brew install reattach-to-user-namespace

# Remove outdated versions from the cellar
brew cleanup
