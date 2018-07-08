#!/usr/bin/env bash

function backup() {
  mkdir -p ~/dotfiles.backup/
  [ -f ~/.zshrc ] && cp $(realpath ~/.zshrc) ~/dotfiles.backup/
  [ -f ~/.gitconfig ] && cp $(realpath ~/.gitconfig) ~/dotfiles.backup/
  [ -f ~/.gitignore ] && cp $(realpath ~/.gitignore) ~/dotfiles.backup/
  [ -f ~/.tmux.conf ] && cp $(realpath ~/.tmux.conf) ~/dotfiles.backup/
  [ -f ~/.tigrc ] && cp $(realpath ~/.tigrc) ~/dotfiles.backup/
  [ -f ~/.config/nvim/init.vim ] && cp $(realpath ~/.config/nvim/init.vim) ~/dotfiles.backup/
  echo "Dotfiles have been backed up!"
}

function install() {
  ln -sf ~/.dotfiles/zshrc ~/.zshrc
  ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
  ln -sf ~/.dotfiles/gitignore ~/.gitignore
  ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
  ln -sf ~/.dotfiles/tigrc ~/.tigrc
  ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
  echo "Dotfiles have been installed!"
}

function update() {
  cd ~/.dotfiles/ && git pull origin master
  echo "Dotfiles have been updated!"
}

case "$1" in
"")
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    install
  fi
  ;;
"--backup" | "-b")
  backup
  ;;
"--install" | "-i")
  install
  ;;
"--update" | "-u")
  update
  ;;
*)
  echo "No manual entry for $1"
  ;;
esac
