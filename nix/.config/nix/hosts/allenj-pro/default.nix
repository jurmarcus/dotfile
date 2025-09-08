{
  pkgs,
  config,
  lib,
  ...
}:
{
  my.primaryUser = "allenj";

  my.homebrew.bundles = {
    desktop.enable = true;
    developer.enable = true;
    entertainment.enable = true;
    standard.enable = true;
  };

  my.homebrew.features = {
    communication.enable = lib.mkForce false;
  };
}
