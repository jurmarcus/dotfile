# Install once if missing (XDG-friendly)
: ${XDG_DATA_HOME:="$HOME/.local/share"}
local antidote_dir="$XDG_DATA_HOME/antidote"
[[ -d "$antidote_dir" ]] || git clone --depth=1 https://github.com/mattmc3/antidote "$antidote_dir"

source "$antidote_dir/antidote.zsh"

# Resolve plugin bundles listed in $ZDOTDIR/plugins.txt into a fast, static file
local bundle_cache="$XDG_CACHE_HOME/zsh/antidote-bundles.zsh"
antidote bundle < "$ZDOTDIR/plugins.txt" >| "$bundle_cache"
source "$bundle_cache"
