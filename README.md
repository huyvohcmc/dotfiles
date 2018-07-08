<div align="center">

<img src="screenshot.png" />

<br />
<br />

[![forthebadge](https://forthebadge.com/images/badges/built-with-science.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)](https://forthebadge.com)

<p>A set of neovim, zsh, git, and tmux configuration files, made with blood sweat and tears.</p>

</div>

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

```
git clone git@github.com:huyvohcmc/dotfiles.git dotfiles
```

Create a backup for existing dotfiles at `~/dotfiles.backup` and install the new ones:

```
cd dotfiles && ./bootstrap.sh
```

The bootstrap script support 3 arguments:

- `--install | -i` is set by default
- `--update | -u` to fetch the latest dotfiles from remote
- `--backup | -b` to backup the dotfiles and save to `~/.dotfiles.backup`

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
