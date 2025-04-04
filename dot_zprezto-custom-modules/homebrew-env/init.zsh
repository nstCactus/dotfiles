# Detect Homebrew installation
if [[ -x /opt/homebrew/bin/brew ]]; then
  export BREW_PREFIX="/opt/homebrew"   # macOS (Apple Silicon)
elif [[ -x /usr/local/bin/brew ]]; then
  export BREW_PREFIX="/usr/local"       # macOS (Intel)
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  export BREW_PREFIX="/home/linuxbrew/.linuxbrew" # Linuxbrew (system-wide)
elif [[ -x ~/.linuxbrew/bin/brew ]]; then
  export BREW_PREFIX="$HOME/.linuxbrew" # Linuxbrew (user-local)
else
  return  # Exit if Homebrew is not installed
fi

# Set up paths
export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH"
export MANPATH="$BREW_PREFIX/share/man:${MANPATH:-}"
export INFOPATH="$BREW_PREFIX/share/info:${INFOPATH:-}"

# Add Homebrew’s Zsh completions BEFORE Prezto runs `compinit`
if [[ -d "$BREW_PREFIX/share/zsh/site-functions" ]]; then
  fpath+=("$BREW_PREFIX/share/zsh/site-functions")
fi
