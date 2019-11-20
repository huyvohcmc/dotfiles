export PATH="/usr/local/sbin:$PATH"

# Oh-My-Zsh
export ZSH=~/.oh-my-zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# Plugins
export PLUGINS=$HOME/.zsh/plugins
[ -f $PLUGINS/git/git.zsh ] && source $PLUGINS/git/git.zsh
[ -f $PLUGINS/docker-compose/docker-compose.zsh ] && source $PLUGINS/docker-compose/docker-compose.zsh
[ -f $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source $PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f $PLUGINS/z.lua/z.lua ] && eval "$(lua $PLUGINS/z.lua/z.lua --init zsh enhanced once)"

# Theme
export THEMES=$HOME/dotfiles/zsh/themes
source $THEMES/zeit.zsh-theme
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=121'

# RVM
export PATH=$PATH:$HOME/.rvm/bin
[ -f $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

# NVM
export NVM_DIR=$HOME/.nvm
if [ -f $HOME/.nvm/alias/default ]; then
  PATH=${PATH}:${HOME}/.nvm/versions/node/v$(cat ~/.nvm/alias/default)/bin
fi
nvm() {
  [ -s $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh
  nvm "$@"
}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"'

# Ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

# Secrets
[ -f ~/.secrets ] && source ~/.secrets

# Aliases
alias v='nvim'
alias vc='nvim ~/.config/nvim/init.vim'
