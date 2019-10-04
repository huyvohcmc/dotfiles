autoload -U promptinit; promptinit
prompt purer

plugins=(wd git docker-compose)

export ZSH=~/.oh-my-zsh
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"'

export PATH="/usr/local/bin:/usr/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

[ -s "$ZSH/oh-my-zsh.sh" ] && . "$ZSH/oh-my-zsh.sh"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=121'

# tmux {{{
connect_to_most_recent_tmux_session() {
  if _not_in_tmux; then
    if _any_tmux_sessions; then
      tmux attach -t "$(_most_recent_tmux_session)"
    else
      tmux
    fi
  fi
}

# Returns the name of the most recent tmux session, sorted by time the session
# was last attached.
_most_recent_tmux_session(){
  tmux list-sessions -F "#{session_last_attached} #{session_name}" | \
    sort -r | \
    cut -d' ' -f2 | \
    head -1
}

_not_in_tmux() {
  [[ -z "$TMUX" ]]
}

_any_tmux_sessions() {
  [[ -n "$(tmux ls 2>/dev/null)" ]]
}

inside_ssh(){
  [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
}

if ! inside_ssh; then
  connect_to_most_recent_tmux_session
fi
# }}}
