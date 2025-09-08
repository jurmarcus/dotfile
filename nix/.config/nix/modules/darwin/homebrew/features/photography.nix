{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.photography;
in
{
  options.my.homebrew.features.photography.enable = lib.mkEnableOption "Photography (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.masApps = {
      "Photomator" = 1444636541;
    };
  };
}
