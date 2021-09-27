# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=nvim
export LC_ALL=en_us.utf-8
export LANG=en_US.UTF-8

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export HISTFILESIZE=${HISTSIZE}
export HISTTIMEFORMAT="[%F %T] "
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt share_history

# cd without the need of typing cd
setopt auto_cd

# Edit command line in full screen editor
autoload edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey '^A' beginning-of-line '^E' end-of-line '^W' backward-kill-word

# Modules
zmodload -i zsh/complist

# Aliases
alias v='$EDITOR'
alias lg='lazygit'
alias ls='ls -G'
alias ll='ls -lG'
alias lsa='ls -lahG'

# Secrets
[ -f ~/.secrets ] && source ~/.secrets

# ASDF
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Zinit plugins
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  atinit'zstyle ":history-search-multi-word" page-size "7"' \
    zdharma/history-search-multi-word \
  blockf \
    zsh-users/zsh-completions

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit ice depth=1; zinit light romkatv/powerlevel10k

# OMZ plugins
zinit wait lucid for \
  OMZL::git.zsh \
  OMZP::git \
  OMZP::docker-compose

# Completion menu
zstyle ':completion:*' menu yes select

# Z.lua
[ -f $HOME/.zsh/z.lua/z.lua ] && eval "$(lua $HOME/.zsh/z.lua/z.lua --init zsh enhanced once)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
