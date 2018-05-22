# dotfiles

A set of neovim, zsh, git, and tmux configuration files, made with blood sweat and tears.

## Screenshot

![screenshot](screenshot.png)

**Terminal**: [iTerm2](https://www.iterm2.com/) with [Nord](https://github.com/arcticicestudio/nord-iterm2) theme and [Iosevka](https://github.com/be5invis/Iosevka) font (17pt).

## Prerequisites

Make sure the following requirements are installed:

- homebrew
- git
- neovim
- vim-plug
- tmux
- rvm and nvm
- zsh and oh-my-zsh
- universal-ctags
- the_silver_searcher

## Installation

Clone this project into `~/.dotfiles` directory:

```
git clone git@github.com:huyvohcmc/dotfiles.git ~/.dotfiles
```

Install dotfiles:

```
cd ~/.dotfiles && ./install.sh
```

## ZSH plugins

Install spaceship theme:

```
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Install zsh-completions:

```
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
```

Install zsh-autosuggestions:

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

## Neovim plugins

In order to get [ALE](https://github.com/w0rp/ale) to work properly, you need to install [rubocop](https://github.com/bbatsov/rubocop) and [eslint](https://github.com/eslint/eslint):

```
gem install rubocop
npm install -g eslint
```

## IRB customizations

```
gem install awesome_print interactive_editor
```
