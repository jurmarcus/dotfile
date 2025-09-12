# ~/.config/zsh/options.zsh

# Persistent history behavior
setopt HIST_SAVE_NO_DUPS      # don't write dup lines to $HISTFILE
setopt INC_APPEND_HISTORY     # write each command as it's executed

# Pushd behavior
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Quality-of-life
setopt autocd                 # cd by typing directory name
