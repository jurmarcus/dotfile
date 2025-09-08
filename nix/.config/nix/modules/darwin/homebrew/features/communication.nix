{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.communication;
in
{
  options.my.homebrew.features.communication.enable =
    lib.mkEnableOption "Communication & social (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "discord"
    ];
    homebrew.masApps = {
      "Line" = 539883307;
    };
  };
}
