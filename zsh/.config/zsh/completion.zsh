# ~/.config/zsh/completion.zsh

# Completion system with XDG-cached zcompdump (faster startup)
mkdir -p "$XDG_CACHE_HOME/zsh"
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Nice selection UI in completion menus
zmodload zsh/complist 2>/dev/null
zstyle ':completion:*' menu select

# fzf key bindings + completion (only if installed)
if command -v fzf >/dev/null 2>&1; then
  # Equivalent to your: source <(fzf --zsh)
  source <(fzf --zsh)
fi
