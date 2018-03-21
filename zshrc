export ZSH=~/.oh-my-zsh

export TERM="xterm-256color"

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

alias nvcf="nvim ~/.config/nvim/init.vim"

alias v="nvim"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.rvm/scripts/rvm

source $ZSH/oh-my-zsh.sh
