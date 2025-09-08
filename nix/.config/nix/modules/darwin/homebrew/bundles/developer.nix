{ config, lib, ... }:
{
  options.my.homebrew.bundles.developer.enable = lib.mkEnableOption "Developer bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.developer.enable {
    my.homebrew.features = {
      developer.enable = true;
    };
  };
}
