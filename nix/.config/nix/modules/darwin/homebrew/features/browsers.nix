{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.browsers;
in
{
  options.my.homebrew.features.browsers.enable = lib.mkEnableOption "Web browsers (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      # Firefox
      "zen"
      # Chrome
      "google-chrome"
    ];
  };
}
