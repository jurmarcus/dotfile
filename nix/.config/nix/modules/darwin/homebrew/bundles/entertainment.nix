{ config, lib, ... }:
{
  options.my.homebrew.bundles.entertainment.enable =
    lib.mkEnableOption "Entertainment bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.entertainment.enable {
    my.homebrew.features = {
      entertainment.enable = true;
    };
  };
}
