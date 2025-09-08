{
  pkgs,
  config,
  lib,
  ...
}:
{
  my.primaryUser = "methylene";

  my.homebrew.bundles = {
    desktop.enable = true;
    developer.enable = true;
    editors.enable = true;
    entertainment.enable = true;
    learning.enable = true;
    photography.enable = true;
    standard.enable = true;
  };
}
