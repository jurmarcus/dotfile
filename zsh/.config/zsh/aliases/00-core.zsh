# eza equivalents
alias ls='eza --group-directories-first --icons'
alias ll='eza -lAh --group-directories-first --icons'

# work environment
if [[ "$(hostname)" == "allenj-macbook" ]]; then
    alias code='code-fb'
fi

# ISO timestamps instead of locale-dependent ones:
export EZA_TIME_STYLE=long-iso

alias nano='nvim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias hg='sl'
