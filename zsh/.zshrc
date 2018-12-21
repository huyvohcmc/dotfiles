plugins=(
  wd
  git
  docker-compose
)
autoload -U promptinit; promptinit
prompt purer
PURE_PROMPT_SYMBOL='▶'

alias v="nvim"
alias vc="nvim ~/.config/nvim/init.vim"

export EDITOR=nvim
export ZSH=~/.oh-my-zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export PATH="/usr/local/bin:/usr/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source $HOME/.rvm/scripts/rvm
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
