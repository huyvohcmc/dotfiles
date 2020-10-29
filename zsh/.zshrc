# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$HOME/.zsh_history

# Prompt
source $HOME/dotfiles/zsh-themes/custom.zsh-theme

# Shell aliases
alias v='$EDITOR'
alias ev='$EDITOR ~/.config/nvim/init.vim'
alias lg='lazygit'
alias ls='ls -G'
alias ll='ls -lG'
alias lsa='ls -lahG'

# Bindkeys
autoload edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey '^A' beginning-of-line '^E' end-of-line '^W' backward-kill-word

# Setopts
setopt AUTO_CD
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt PROMPT_SUBST

# Completion and ls colors
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Autoload
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit;
else
  compinit -C;
fi;
autoload -Uz colors && colors
zmodload -i zsh/complist

# Zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load plugins
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=121'
zinit load zdharma/history-search-multi-word
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

# Z.lua
[ -f $HOME/.zsh/z.lua/z.lua ] && eval "$(lua $HOME/.zsh/z.lua/z.lua --init zsh enhanced once fzf)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!{.git,node_modules,flow-typed}"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

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
  PATH=${PATH}:${HOME}/.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin
fi
nvm() {
  [ -s $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh
  nvm "$@"
}
