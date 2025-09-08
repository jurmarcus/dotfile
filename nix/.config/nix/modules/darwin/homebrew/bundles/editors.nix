{ config, lib, ... }:
{
  options.my.homebrew.bundles.editors.enable =
    lib.mkEnableOption "Personal Editors bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.editors.enable {
    my.homebrew.features = {
      editors.enable = true;
    };
  };
}
