{ config, lib, ... }:
{
  options.my.homebrew.bundles.standard.enable =
    lib.mkEnableOption "Standard baseline bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.standard.enable {
    my.homebrew.features = {
      security.enable = true;
      browsers.enable = true;
      utilities.enable = true;
    };
  };
}
