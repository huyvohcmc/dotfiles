local resetColor="%{$reset_color%}"
local hostname="%{$fg_bold[white]%}%m$resetColor$resetColor"
local dir="%{$fg_bold[white]%}%~$resetColor$resetColor"
local _separator="%{$fg[magenta]%}::$resetColor$resetColor"
local _return_status="%{$fg[red]%}%(?..⍉ )$resetColor$resetColor"
local _prompt_symbol="%{$fg[green]➜$resetColor$resetColor"

GIT_PROMPT_PREFIX="%{$fg[white]%}"
GIT_PROMPT_SUFFIX="$resetColor "
GIT_PROMPT_DIRTY="%{$fg[yellow]%}"
GIT_PROMPT_CLEAN="%{$fg[green]%}"

function branch_is_dirty() {
  local STATUS=''
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ $POST_1_7_2_GIT -gt 0 ]]; then
    FLAGS+='--ignore-submodules=dirty'
  fi
  if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
    FLAGS+='--untracked-files=no'
  fi
  STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    return 0
  else
    return 1
  fi
}

function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

function git_prompt() {
  branch=$(git_current_branch)
  if [ "$branch" = '' ]; then
    # not a git repo
    echo ''
  else
    if branch_is_dirty; then
      echo "$GIT_PROMPT_PREFIX$GIT_PROMPT_DIRTY$branch$GIT_PROMPT_SUFFIX"
    else
      echo "$GIT_PROMPT_PREFIX$GIT_PROMPT_CLEAN$branch$GIT_PROMPT_SUFFIX"
    fi
  fi
}

PROMPT='$hostname $_separator $dir $(git_prompt)$_return_status$_prompt_symbol '
