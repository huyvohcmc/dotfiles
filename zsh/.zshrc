export PATH="/usr/local/sbin:$PATH"

# Oh-My-Zsh
export ZSH=~/.oh-my-zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# Install zplugin if not already
if [ ! -d $HOME/.zplugin ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

### Added by Zplugin's installer
source $HOME/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# Load plugins
zplugin load zsh-users/zsh-history-substring-search
zplugin light zsh-users/zsh-autosuggestions
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

# Z.lua
[ -f $HOME/.zsh/z.lua/z.lua ] && eval "$(lua $HOME/.zsh/z.lua/z.lua --init zsh enhanced once)"

# Theme
export THEMES=$HOME/dotfiles/zsh/themes
source $THEMES/zeit.zsh-theme
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=121'

# Rbenv
if [[ -s ~/.rbenv/shims/ruby ]]; then
  PATH=$HOME/.rbenv/shims:$PATH
fi
rbenv() {
  eval "$(command rbenv init - --no-rehash)"
  rbenv "$@"
}

# Nvm
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

# Aliases and secrets
source $HOME/dotfiles/zsh/aliases
[ -f ~/.secrets ] && source ~/.secrets
