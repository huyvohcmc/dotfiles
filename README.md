# dotfiles

A set of neovim, zsh, git, and tmux configuration files, made with blood sweat and tears.

## Screenshot

![screenshot](screenshot.png)

## Prerequisites

- neovim
- vim-plug
- tmux
- zsh + oh-my-zsh

## Homebrew packages

- fzf
- the_silver_searcher
- universal_ctags
- zsh-autosuggestions
- zsh-completions

## Terminal

- Terminal: iTerm2
- Font: Fira Code 17pt
- Colorscheme: Nord

## Installation

```
git clone git@github.com:huyvohcmc/dotfiles.git ~/.dotfiles
```

Create symlinks:

```
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
```
