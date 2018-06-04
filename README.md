<div align="center">

<img src="screenshot.png" />

[![forthebadge](https://forthebadge.com/images/badges/built-with-science.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)](https://forthebadge.com)

<p>A set of neovim, zsh, git, and tmux configuration files, made with blood sweat and tears.</p>

</div>

---

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
$ git clone git@github.com:huyvohcmc/dotfiles.git ~/.dotfiles
```

Create symbolic links:

```
$ cd ~/.dotfiles && ./install.sh
```

## Neovim

This configuration is maded for Ruby and React development, so you should install [rubocop](https://github.com/bbatsov/rubocop) and [eslint](https://github.com/eslint/eslint) in order for [ALE](https://github.com/w0rp/ale) to work properly:

```
$ gem install rubocop
$ npm install -g eslint
```

## ZSH plugins

I only use [zsh-completions](https://github.com/zsh-users/zsh-completions) and [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions). You can visit [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins) for more useful stuff.

## Iosevka

[Iosevka](https://github.com/be5invis/Iosevka) is one of the best programming fonts out there. My font config is regular Iosevka, 16 pt and 560 character width.
