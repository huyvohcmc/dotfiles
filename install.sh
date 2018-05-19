#!/bin/sh

echo 'Starting...'

# Remove default config files if they're already exist
[ -f ~/.zshrc ] && rm -rf ~/.zshrc
[ -f ~/.gitconfig ] && rm -rf ~/.gitconfig
[ -f ~/.tmux.conf ] && rm -rf ~/.tmux.conf
[ -f ~/.config/nvim/init.vim ] && rm -rf ~/.config/nvim/init.vim

# Create symbolic links
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim

echo 'Done'
