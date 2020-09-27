prompt() {
  echo '%(?.%f.%F{red})%B▲%b%f '
}

session() {
  echo "($USER.$HOST) "
}

path() {
  echo '%F{white}%B%c%b%f '
}

git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

git_status() {
  BRANCH=`git_current_branch`
  if [ ! -z $BRANCH ]; then
    if [ ! -z "$(git status --short)" ]; then
      echo -n "[%F{red}%B$BRANCH%b"
    else
      echo -n "[%F{green}%B$BRANCH%b"
    fi
    echo -n '%F{white}]%f '
  fi
}

PS1='$(prompt)$(session)$(path)$(git_status)'
