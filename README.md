# dotfiles

A set of neovim, zsh, git, and tmux configuration files, made with blood sweat and tears.

### Screenshot

![terminal](terminal.png)

### Prerequisites

- Neovim: https://github.com/neovim/neovim
- Vim-plug: https://github.com/junegunn/vim-plug
- Zsh + Oh My Zsh: https://github.com/robbyrussell/oh-my-zsh
- Tmux: https://github.com/tmux/tmux

#### Homebrew packages

- fzf
- the_silver_searcher
- universal_ctags
- zsh-autosuggestions
- zsh-completions

### Installation

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

### Terminal

I use [iTerm2](https://www.iterm2.com/) as the main terminal. The choice of font is [Fira Code](https://github.com/tonsky/FiraCode) 16 pt. Both iTerm2 and Fira Code support ligatures, which is a very nice feature. An alternative choice for Fira Code is [Iosevka](https://github.com/be5invis/Iosevka) (highly recommend).

### IRB customizations

I use [awesome_print](https://github.com/awesome-print/awesome_print) to pretty prints Ruby objects in full color:

```
gem install awesome_print
```
