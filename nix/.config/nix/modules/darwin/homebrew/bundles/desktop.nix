{ config, lib, ... }:
{
  options.my.homebrew.bundles.desktop.enable = lib.mkEnableOption "Desktop bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.desktop.enable {
    my.homebrew.features = {
      communication.enable = true;
      hardware.enable = true;
    };
  };
}
