# ~/.config/zsh/tooling.zsh

# zoxide for efficient directory jumps (only if installed)
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# Starship prompt (only if installed)
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
