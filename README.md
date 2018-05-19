# dotfiles

A set of neovim, zsh, git, and tmux configuration files, made with blood sweat and tears.

## Screenshot

![screenshot](screenshot.png)

## Prerequisites

Neovim requires Python 2, Python 3, Ruby and Node installed (https://github.com/neovim/neovim/wiki/FAQ).

Because this dotfiles aims to Ruby and React development, [rvm](https://rvm.io/) and [nvm](https://github.com/creationix/nvm) should also be installed.

## Installation

Install Homebrew:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Add the following line to `.bashrc` file:

```
export PATH=/usr/local/bin:$PATH
```

Install zsh and set zsh as the default shell:

```
brew install zsh
chsh -s $(which zsh)
```

Install zsh-autosuggestions:

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

Install zsh-completions:

```
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
```

Install Neovim and vim-plug:

```
brew install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install universtal-ctags:

```
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

Install the_silver_searcher:

```
brew install the_silver_searcher
```

Install tmux:

```
brew install tmux
```

Clone this project to ~/.dotfiles directory:

```
git clone git@github.com:huyvohcmc/dotfiles.git ~/.dotfiles
```

Remove default config files:

```
```

Create symbolic links:

```
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
```
