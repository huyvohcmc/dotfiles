Even though this is my macos dotfiles, most of them can be used on other unix-like operating systems perfectly fine.

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

## Screenshots (in the [Wiki](https://github.com/huyvohcmc/dotfiles/wiki))

## FAQ

- What terminal emulator is shown on the screenshots?

  This is [alacritty](https://github.com/alacritty/alacritty). A cross-platform, GPU-accelerated terminal emulator.

- Why Neovim over Vim?

  One of the main reason is neovim has better developer community.

- Why no oh-my-zsh?

  Setting up zsh with no oh-my-zsh will give you more understanding of zsh itself and how it works as a terminal shell.

- What font is being used on the screenshots?

  [Iosevka](https://github.com/be5invis/Iosevka/releases/tag/v3.0.0), 12pt.
