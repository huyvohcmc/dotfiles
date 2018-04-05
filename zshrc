export ZSH=~/.oh-my-zsh

export TERM="xterm-256color"

export EDITOR=nvim

ZSH_THEME="powerlevel9k/powerlevel9k"

CASE_SENSITIVE="false"

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="false"

plugins=(
  dotenv
  zsh-autosuggestions
  history-substring-search
)

autoload -U compinit && compinit

alias vc="nvim ~/.config/nvim/init.vim"

alias v="nvim"

export NVM_DIR="$HOME/.nvm"

export PATH="/usr/local/bin:/usr/bin:$PATH"

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.rvm/scripts/rvm

source $ZSH/oh-my-zsh.sh
