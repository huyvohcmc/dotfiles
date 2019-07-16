# Enter The Eternal Laziness

![for hackers](https://img.shields.io/badge/built%20for-hackers-50dd7e.svg?logo=dependabot&style=flat-square)
![awesome](https://img.shields.io/badge/pretty-awesome-ffc24b.svg?logo=sourcegraph&style=flat-square)
![compatible](https://img.shields.io/badge/compatibility-betamax-f43753.svg?logo=docker&style=flat-square)
![smile](https://img.shields.io/badge/makes%20people-smile-57c7fe.svg?logo=travis&style=flat-square)
![PRs welcome](https://img.shields.io/badge/PRs-welcome-ff69b4.svg?logo=lgtm&style=flat-square)

![preview](./screenshots/preview.png)

## Table of Contents

  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
  * [Postinstall](#postinstall)
  * [What's inside init.vim?](#whats-inside-initvim)
  * [Highlights](#highlights)
  * [Git config](#git-config)
  * [Iosevka](#iosevka)
  * [Special thanks](#special-thanks)
  * [License](#license)

## Prerequisites

Make sure the following requirements are installed:

<details>
<summary>Expand</summary>

### Homebrew

Install [Homebrew](https://brew.sh) if you haven't.

### Git

You can either install git via Xcode Command Line Tools or by running `git --version` from your terminal.

### Zsh & Oh-My-Zsh

[The Z shell](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH), is an extended version of the Bourne Shell (sh), with plenty of new features, and support for plugins and themes. [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) is a delightful community-driven framework for managing your zsh configuration.

This project use [purer](https://github.com/DFurnes/purer) as the prompt theme for zsh: `npm install --global purer-prompt`

### RVM

RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems. Install RVM: https://rvm.io.

### NVM

Node Version Manager - Simple bash script to manage multiple active node.js versions. To install nvm: https://github.com/creationix/nvm.

### Neovim

[Neovim](https://github.com/neovim/neovim) (nvim) is a forked version of Vim and arguable to be a lot faster. Follow this guide to build [nvim from source](https://github.com/neovim/neovim/wiki/Building-Neovim) and this guide to install [vim-plug](https://github.com/junegunn/vim-plug) as the main nvim plugin manager.

### Tmux

[Tmux](https://github.com/tmux/tmux/wiki) is the terminal multiplexer I can't live without. 
</details>

## Installation

Clone this project at `$HOME`:

```bash
$ git clone git@github.com:huyvohcmc/dotfiles.git
$ cd dotfiles
```

Use Homebrew to install some necessary packages defined in `Brewfile`:

```bash
$ brew bundle
```

Create a backup of your existing dotfiles, remove them in `$HOME` and install the new ones using [stow](https://www.gnu.org/software/stow/):

```bash
$ make stow
```

To remove dotfiles:

```bash
$ make unstow
```

## Postinstall

Open nvim and install all plugins: `:PlugInstall`. You should also run `:checkhealth` to check your nvim condition.

Install [Tmux plugin manager](https://github.com/tmux-plugins/tpm) and press `prefix` + `I` inside a tmux session to fetch the plugins listed in `.tmux.conf`.

## What's inside init.vim?

Visit [the wiki](https://github.com/huyvohcmc/dotfiles/wiki/Neovim-plugins) for more details.

## Highlights

The `Brewfile` contains some interesting CLI tools for better development like

- `bat`, an alternative of `cat`
- `htop`, an interactive process viewer for Unix systems
- `nnn`, a very fast terminal file manager
- `ripgrep`, a line-oriented search tool
- `stow`, a symlink farm manager
- `the_silver_searcher`, a code searching tool (used in vim)
- `fzf`, command-line fuzzy finder
- `tig`, text-mode interface for git
- `universal-ctags`, a programming tool to generate tag files

## Git config

To prevent people from accidentally committing under your name:

```bash
# .gitconfig
[user]
  # set in ~/.gitconfig_local
[include]
  path = ~/.gitconfig_local
```

Where `~/.gitconfig_local` is simply:

```bash
[user]
  name = <your_name>
  email = <your_email>
```

I also use a `.gitmessage` template for co-authored commits on GitHub:

```bash
# ~/.gitmessage
Co-authored-by: Linus Torvalds <torvalds@transmeta.com>
```

## Iosevka

[Iosevka](https://github.com/be5invis/Iosevka) is one of the best font for programmers, it looks so good to the eye and supports ligatures. It also has many prebuilt variants, and if you build yourself you can customize the look of many different characters. Here is how I built an Iosevka version for my own:

1. Clone the repository
2. Ensure `nodejs` >= 8.4, `ttfautohint` and `otfcc` are installed
3. Install necessary libs by `npm install`
4. `npm run build -- contents::iosevka`
5. `npm run build -- contents::iosevka-term` (for term version)

Visit Iosevka's main repo for more build instructions.

## Special thanks

- [ahmedelgabri's dotfiles](https://github.com/ahmedelgabri/dotfiles)
- [thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles)
- [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Amir Salihefendic's vimrc](https://github.com/amix/vimrc)

## License

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fhuyvohcmc%2Fdotfiles.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fhuyvohcmc%2Fdotfiles?ref=badge_large)

This repository is available under the [MIT license](LICENSE). Feel free to fork and modify the dotfiles as you please.
