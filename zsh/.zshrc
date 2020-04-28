export PATH="/usr/local/sbin:$PATH"
export EDITOR=nvim

# History file configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# Completion
autoload -U compinit && compinit
zmodload -i zsh/complist
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# Colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt auto_cd
setopt multios
setopt prompt_subst

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Install Zplugin if not already
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

# rbenv
if [[ -s ~/.rbenv/shims/ruby ]]; then
  PATH=$HOME/.rbenv/shims:$PATH
fi
rbenv() {
  eval "$(command rbenv init - --no-rehash)"
  rbenv "$@"
}

# nvm
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
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case -g "!{.git,node_modules}"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

# Aliases and secrets
source $HOME/dotfiles/zsh/aliases
[ -f ~/.secrets ] && source ~/.secrets
