{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.learning;
in
{
  options.my.homebrew.features.learning.enable = lib.mkEnableOption "Learning (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "anki"
    ];
  };
}
