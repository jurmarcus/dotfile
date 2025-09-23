# ~/.config/zsh/.zshrc
emulate -LR zsh

# Core pieces (order matters a bit)
for f in options.zsh exports.zsh keybinds.zsh completion.zsh tooling.zsh; do
  [[ -r "$ZDOTDIR/$f" ]] && source "$ZDOTDIR/$f"
done

source "$ZDOTDIR/plugin-manager.zsh"

for f in completion.zsh tooling.zsh; do
  [[ -r "$ZDOTDIR/$f" ]] && source "$ZDOTDIR/$f"
done

# Aliases (your requested location)
for f in "$ZDOTDIR"/aliases/*.zsh(N); do
  source "$f"
done

# Functions
fpath=("$ZDOTDIR/functions" $fpath)
# autoload everything under $ZDOTDIR/functions
for f in "$ZDOTDIR"/functions/*.zsh(N); do
  autoload -Uz "${f:t:r}"
done
