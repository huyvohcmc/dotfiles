# Source Zinit
source ~/.zinit/bin/zinit.zsh

# Load plugins
zinit light zsh-users/zsh-autosuggestions
zinit load zdharma/history-search-multi-word
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

export EDITOR=nvim
export PATH="$HOME/.cargo/bin:$PATH"

# Completion
autoload -U compinit && compinit
zmodload -i zsh/complist

# Colors
autoload -U colors && colors
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

setopt prompt_subst # Turn on command substitution in the prompt
setopt auto_cd # Auto cd if command can't be executed and is the name of a directory

# Zstyle
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$HOME/.zcompcache"
zstyle ':completion:*' list-colors $LS_COLORS
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' rehash true

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory notify
unsetopt beep nomatch

setopt bang_hist
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify
setopt extended_history

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Z.lua
[ -f $HOME/.zsh/z.lua/z.lua ] && eval "$(lua $HOME/.zsh/z.lua/z.lua --init zsh enhanced once)"

# Theme
export THEMES=$HOME/dotfiles/zsh-themes
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
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case -g "!{.git,node_modules}"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

# Aliases
alias v='$EDITOR'
alias ev='$EDITOR ~/.config/nvim/init.vim'
alias lg='lazygit'
alias ec='$EDITOR ~/.zshrc'
alias sc='source ~/.zshrc'
alias lsa='ls -lah'
alias ll='ls -lh'
alias ...='../..'
