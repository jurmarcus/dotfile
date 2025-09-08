{
  pkgs,
  config,
  lib,
  ...
}:
{
  my.primaryUser = "methylene";

  my.homebrew.bundles = {
    developer.enable = true;
    editors.enable = true;
    entertainment.enable = true;
    standard.enable = true;
  };
}
