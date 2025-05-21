BREW_LOCATIONS=(
  /opt/homebrew/bin/brew              # macOS (Apple Silicon)
  /usr/local/bin/brew                 # macOS (Intel)
  /home/linuxbrew/.linuxbrew/bin/brew # Linuxbrew (system-wide)
  "$HOME/.linuxbrew/bin/brew"         # Linuxbrew (user-local)
)

BREW_EXEC=""

# Find brew executable
for brewPathCandidate in "${BREW_LOCATIONS[@]}"; do
  if [[ -x "$brewPathCandidate" ]]; then
    BREW_EXEC="$brewPathCandidate"
    break
  fi
done

# Exit if brew not found
if [[ -z "$BREW_EXEC" ]]; then
  return
fi

# Use brew to determine prefix
BREW_PREFIX="$("$BREW_EXEC" --prefix)"

# Set up paths
export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH"
export MANPATH="$BREW_PREFIX/share/man:${MANPATH:-}"
export INFOPATH="$BREW_PREFIX/share/info:${INFOPATH:-}"

# Add Homebrew’s Zsh completions BEFORE Prezto runs `compinit`
if [[ -d "$BREW_PREFIX/share/zsh/site-functions" ]]; then
  fpath+=("$BREW_PREFIX/share/zsh/site-functions")
fi
