plugins=(wd git docker-compose)
autoload -U promptinit; promptinit
prompt purer

export EDITOR=nvim
export ZSH=~/.oh-my-zsh
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"
export NVM_DIR="$HOME/.nvm"
export PATH="/usr/local/bin:/usr/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

[ -f $NVM_DIR/nvm.sh ] && \. $NVM_DIR/nvm.sh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh

alias v="nvim"
alias vc="nvim ~/.config/nvim/init.vim"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=121'
