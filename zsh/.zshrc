# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE SHARE_HISTORY INC_APPEND_HISTORY

# --- Shell behavior ---
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# --- General aliases ---
alias v='$EDITOR'
alias ls='ls -G'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# --- Completion ---
fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# --- Prompt (pure) ---
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit && promptinit
prompt pure

# --- Tools ---
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# --- Aliases: git ---
alias gst='git status'
alias gd='git diff'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git push'
alias gl='git pull'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcmsg='git commit -m'
alias gb='git branch'
alias glog='git log --oneline --decorate --graph'
alias gsta='git stash push'
alias gstp='git stash pop'

# --- Plugins (Homebrew) ---
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# fast-syntax-highlighting must be last
source "$(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
