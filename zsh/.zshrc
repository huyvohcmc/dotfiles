plugins=(
  wd
  git
  docker
  docker-compose
  zsh-autosuggestions
  history-substring-search
)
autoload -U promptinit; promptinit
prompt purer

alias v="nvim"
alias vc="nvim ~/.config/nvim/init.vim"

export ZSH=~/.oh-my-zsh
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --ignore --hidden --glob "!.git/*"'
export PATH="/usr/local/bin:/usr/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source $HOME/.rvm/scripts/rvm
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
