{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.entertainment;
in
{
  options.my.homebrew.features.entertainment.enable =
    lib.mkEnableOption "Entertainment (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "iina"
      "pocket-casts"
      "brainfm"
    ];
  };
}
