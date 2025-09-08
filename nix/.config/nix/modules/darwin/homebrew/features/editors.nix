{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.editors;
in
{
  options.my.homebrew.features.editors.enable =
    lib.mkEnableOption "Personal Editors (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "visual-studio-code"
    ];
  };
}
