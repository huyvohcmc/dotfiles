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

# Clone zcomet if necessary
if [[ ! -f ${HOME}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${HOME}/.zcomet/bin/zcomet.zsh

zcomet load skywind3000/z.lua
zcomet load ohmyzsh lib git.zsh
zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/docker-compose
zcomet load romkatv/powerlevel10k
zcomet load zdharma-continuum/history-search-multi-word
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-autosuggestions

# Run compinit and compile its cache
zcomet compinit

# Completion menu
zstyle ':completion:*' menu yes select

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Z.lua
eval "$(lua ~/.zcomet/repos/skywind3000/z.lua/z.lua --init zsh once enhanced)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
