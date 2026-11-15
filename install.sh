#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  # back up a real file (not an existing symlink) before replacing it
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak"
    echo "backed up $dest -> $dest.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest"
}

link "$DOTFILES/zsh/.zshrc"      "$HOME/.zshrc"
link "$DOTFILES/zsh/.zshenv"     "$HOME/.zshenv"
link "$DOTFILES/git/.gitconfig"  "$HOME/.gitconfig"
link "$DOTFILES/ghostty/config"  "$HOME/.config/ghostty/config"
