export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim

# PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Secret
[ -f ~/.secrets ] && source ~/.secrets

# Aliases
alias v='$EDITOR'
alias ev='$EDITOR ~/.config/nvim/init.vim'
alias lg='lazygit'
alias ec='$EDITOR ~/.zshrc'
alias sc='source ~/.zshrc'
alias lsa='ls -lah'
alias ll='ls -lh'
alias ...='../..'
