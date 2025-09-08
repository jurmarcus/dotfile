{ config, lib, ... }:
{
  options.my.homebrew.bundles.learning.enable = lib.mkEnableOption "Learning bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.learning.enable {
    my.homebrew.features = {
      learning.enable = true;
    };
  };
}
