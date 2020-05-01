_"Even though this is my macos dotfiles, most of them can be used on other unix-like operating systems perfectly fine."_

## Installation

- Install [homebrew](https://brew.sh/), [neovim](https://neovim.io/), and [alacritty](https://github.com/alacritty/alacritty/)

- Clone this repository to your designated folder

```sh
git clone git@github.com:huyvohcmc/dotfiles.git && cd dotfiles
```

- Install system dependencies in [`macos/Brewfile`](./macos/Brewfile)

```sh
brew bundle
```

- Backup your existing dotfiles, then use [stow](https://www.gnu.org/software/stow/) to install new ones

```sh
make stow
```

This will create the symlinks of this dotfiles in your home folder. To **uninstall** this dotfiles, simply run `make unstow` to remove the symlinks.

## Screenshots

![](https://user-images.githubusercontent.com/17645203/80581688-b3a52380-8a37-11ea-9841-4622c3c5cca0.png)

## FAQ

- What terminal emulator is shown on the screenshots?

  This is [alacritty](https://github.com/alacritty/alacritty). A cross-platform, GPU-accelerated terminal emulator.

- Why Neovim over Vim?

  One of the main reason is neovim has better developer community.

- Why no oh-my-zsh?

  Setting up zsh with no oh-my-zsh will give you more understanding of zsh itself and how it works as a terminal shell.

- What font is being used on the screenshots?

  [JetBrains Mono](https://www.jetbrains.com/lp/mono/), 12pt.
