## What's included

- Neovim, tmux, zsh, alacritty, git, and ripgrep dotfiles
- A snapshot of homebrew's installed packages (details in [`macos/Brewfile`](./macos/Brewfile))

## Installation

```zsh
git clone git@github.com:huyvohcmc/dotfiles.git && cd dotfiles # Clone this repository into your home directory
brew bundle # Install system dependencies (bundled in macos/Brewfile)
make stow # Install dotfiles
```

This will symlink all the dotfiles to your home directory. To **remove** them, simply run `make unstow` to remove the symbolic links.

Screenshots are in the [Wiki](https://github.com/huyvohcmc/dotfiles/wiki).

## FAQ

- What terminal emulator is shown on the screenshots?

  This is [alacritty](https://github.com/alacritty/alacritty). A cross-platform, GPU-accelerated terminal emulator.

- Why Neovim over Vim?

  One of the main reason is neovim has better developer community.

- Why no oh-my-zsh?

  Setting up zsh with no oh-my-zsh will give you more understanding of zsh itself and how it works as a terminal shell.

- What font is being used on the screenshots?

  [Iosevka](https://github.com/be5invis/Iosevka/releases/tag/v3.0.0), 12pt.
