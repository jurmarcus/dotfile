{ config, lib, ... }:
{
  options.my.homebrew.bundles.photography.enable = lib.mkEnableOption "Photography bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.photography.enable {
    my.homebrew.features = {
      photography.enable = true;
    };
  };
}
