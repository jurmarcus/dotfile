{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.utilities;
in
{
  options.my.homebrew.features.utilities.enable = lib.mkEnableOption "Utilities (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "appcleaner"
      "chatgpt"
      "deepl"
      "jordanbaird-ice"
      "localsend"
      "raycast"
      "obsidian"
      "phoenix-slides"
      "the-unarchiver"
    ];
  };
}
