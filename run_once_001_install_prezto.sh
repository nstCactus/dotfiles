#!/usr/bin/env zsh

set -euo pipefail

# Clone Prezto
PREZTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"
if [[ ! -d "${PREZTO_DIR}" ]]; then
  echo "Cloning Prezto in $PREZTO_DIR…"
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$PREZTO_DIR"
fi

# Clone prezto-contrib
echo "Cloning Prezto contrib in $PREZTO_DIR/contrib"
if [[ ! -d "${PREZTO_DIR}/contrib" ]]; then
  echo "Cloning Prezto contrib…"
  git clone --recurse-submodules https://github.com/belak/prezto-contrib "${PREZTO_DIR}/contrib"
fi

# Change shell to ZSH
echo "Changing shell to ZSH… You may need to authenticate."
chsh -s /bin/zsh
