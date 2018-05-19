export ZSH=~/.oh-my-zsh

export EDITOR=nvim

ZSH_THEME="agnoster"

CASE_SENSITIVE="false"

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="false"

plugins=(
  git
  docker
  docker-compose
  zsh-autosuggestions
  history-substring-search
)
autoload -U compinit && compinit

alias vc="nvim ~/.config/nvim/init.vim"

alias v="nvim"

alias dotfiles="cd ~/.dotfiles"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH="/usr/local/bin:/usr/bin:$PATH"

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.rvm/scripts/rvm

source $ZSH/oh-my-zsh.sh
