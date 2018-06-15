#!/bin/sh

printf "Move your dotfiles into ~/.dotfiles.old ... "
mkdir -p ~/.dotfiles.old
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.dotfiles.old/
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.dotfiles.old/
[ -f ~/.gitignore ] && mv ~/.gitignore ~/.dotfiles.old/
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.dotfiles.old/
[ -f ~/.config/nvim/init.vim ] && mv ~/.config/nvim/init.vim ~/.dotfiles.old/
printf "done\n"

printf "Create symbolic links ... "
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
printf "done\n"
