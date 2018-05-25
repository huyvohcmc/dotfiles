plugins=(
  git
  docker
  docker-compose
  zsh-autosuggestions
  history-substring-search
)
autoload -U compinit && compinit

ZSH_THEME="agnoster"

alias v="nvim"
alias vc="nvim ~/.config/nvim/init.vim"
alias dotfiles="cd ~/.dotfiles"
go() {
  cd ~/Projects/"$1"
}

export ZSH=~/.oh-my-zsh
export EDITOR=nvim
export PATH="/usr/local/bin:/usr/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

source $HOME/.rvm/scripts/rvm
source $ZSH/oh-my-zsh.sh
