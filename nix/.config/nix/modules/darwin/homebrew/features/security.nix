{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.security;
in
{
  options.my.homebrew.features.security.enable = lib.mkEnableOption "Security (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "1password"
      "1password-cli"
    ];
  };
}
