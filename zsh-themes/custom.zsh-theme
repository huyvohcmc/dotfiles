session() {
  echo "%F{blue}$USER%F{reset}@%F{green}$HOST "
}

path() {
  echo "%F{blue}%~%f"
}

git_status() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "%F{242}$BRANCH"
    [ ! -z "$(git status --short)" ] && echo -n "%F{white}*%f"
  fi
}

prompt() {
  echo '%(?.%f.%F{red})$%f '
}

PS1='$(session)$(path)$(git_status) $(prompt)'
