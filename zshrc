ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  user
  host
  dir
  git
  line_sep
  jobs
  exit_code
  char
)
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
SPACESHIP_CHAR_SYMBOL="➜  "
SPACESHIP_USER_SHOW="always"
SPACESHIP_HOST_SHOW="always"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"

plugins=(
  git
  docker
  docker-compose
  zsh-autosuggestions
  history-substring-search
)
autoload -U compinit && compinit

alias vc="nvim ~/.config/nvim/init.vim"
alias v="nvim"
alias dotfiles="cd ~/.dotfiles"

export ZSH=~/.oh-my-zsh
export EDITOR=nvim
export PATH="/usr/local/bin:/usr/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

source $HOME/.rvm/scripts/rvm
source $ZSH/oh-my-zsh.sh
