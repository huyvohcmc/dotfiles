_"This repository includes all of my opinionated configuration, on macos. But some of them can be used on other unix-like operating systems as well."_

## Installation

- Install homebrew: https://brew.sh/

- Install neovim: https://neovim.io/

- Install alacritty: https://github.com/alacritty/alacritty/

- Clone this repository to `$HOME`

```sh
git clone git@github.com:huyvohcmc/dotfiles.git
```

- Install system dependencies in [`macos/Brewfile`](./macos/Brewfile)

```sh
brew bundle
```

- Backup your existing dotfiles, then use [stow](https://www.gnu.org/software/stow/) to install new ones

```sh
# cd $HOME/dotfiles
make stow
```

- To remove installed dotfiles

```sh
make unstow
```

## Wiki

Visit wiki for more stuff: https://github.com/huyvohcmc/dotfiles/wiki
