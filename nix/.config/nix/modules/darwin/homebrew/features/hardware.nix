{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.hardware;
in
{
  options.my.homebrew.features.hardware.enable = lib.mkEnableOption "Hardware (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "elgato-camera-hub"
      "elgato-stream-deck"
      "elgato-wave-link"
      "tourbox-console"
    ];
  };
}
