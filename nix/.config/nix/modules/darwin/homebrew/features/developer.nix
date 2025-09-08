{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.developer;
in
{
  options.my.homebrew.features.developer.enable =
    lib.mkEnableOption "Development & terminal (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.brews = [
      "fzf"
      "mas"
      "neovim"
      "sapling"
      "starship"
      "stow"
      "tmux"
      "uv"
      "zoxide"
      "zsh"
    ];
    homebrew.casks = [
      "ghostty"
    ];
  };
}
