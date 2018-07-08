## Dotfiles are meant to be shared

![screenshot](screenshot.png)

[![forthebadge](https://forthebadge.com/images/badges/built-with-science.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)](https://forthebadge.com)

---

## Prerequisites

Make sure the following requirements are installed:

- homebrew
- git
- tig
- neovim
- vim-plug
- tmux
- rvm and nvm
- zsh and oh-my-zsh
- universal-ctags
- the_silver_searcher

## Installation

Clone this project (suppose you are at `$HOME`):

```bash
$ git clone git@github.com:huyvohcmc/dotfiles.git dotfiles
```

Create a backup for existing dotfiles at `~/dotfiles.backup` and install the new ones:

```bash
$ cd dotfiles && ./bootstrap.sh
```

The bootstrap script support 3 arguments:

- `--install | -i` to symlink the dotfiles in this repo
- `--update | -u` to fetch the latest dotfiles from remote
- `--backup | -b` to backup the dotfiles and save to `~/.dotfiles.backup`

## Git Credentials

To prevent people from accidentally committing under my name:

```bash
# gitconfig
[user]
  # set in ~/.gitconfig_local
[include]
  path = ~/.gitconfig_local
```

Where `~/.gitconfig_local` is simply:

```bash
[user]
  name = Huy Vo
  email = huyvohcmc@gmail.com
```

## Neovim

You should install [rubocop](https://github.com/bbatsov/rubocop) and [eslint](https://github.com/eslint/eslint) in order for [ALE](https://github.com/w0rp/ale) to work properly:

```
gem install rubocop
npm install -g eslint
```

## ZSH

Install [purer](https://github.com/DFurnes/purer), a ZSH prompt based on [pure](https://github.com/sindresorhus/pure):

```
npm install --global purer-prompt
```

Next, install [zsh-completions](https://github.com/zsh-users/zsh-completions) and [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions). You can visit [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins) for more useful stuff.

## Iosevka

I use a custom build of [Iosevka](https://github.com/be5invis/Iosevka) (550 width). Use the default tff from its release if you don't think the font is too narrow.

## Will... will this work on Windows?

![Did you just say Windows?](http://i3.kym-cdn.com/photos/images/newsfeed/000/549/293/504.gif)
