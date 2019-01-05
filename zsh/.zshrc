autoload -U promptinit; promptinit
prompt purer

plugins=(wd git docker-compose)

export ZSH=~/.oh-my-zsh
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"

export PATH="/usr/local/bin:/usr/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f $NVM_DIR/nvm.sh ] && \. $NVM_DIR/nvm.sh
[ -f $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=121'
