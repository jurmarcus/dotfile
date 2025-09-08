{ config, lib, ... }:
{
  imports = [
    # Features
    ./features/browsers.nix
    ./features/communication.nix
    ./features/developer.nix
    ./features/editors.nix
    ./features/entertainment.nix
    ./features/hardware.nix
    ./features/learning.nix
    ./features/photography.nix
    ./features/security.nix
    ./features/utilities.nix

    # Bundles
    ./bundles/desktop.nix
    ./bundles/developer.nix
    ./bundles/editors.nix
    ./bundles/entertainment.nix
    ./bundles/learning.nix
    ./bundles/photography.nix
    ./bundles/standard.nix
  ];

  config = {
    homebrew = {
      enable = true;
      brews = [ ];
      casks = [ ];
      masApps = { };

      onActivation = {
        cleanup = "zap";
        autoUpdate = true;
        upgrade = true;
      };
    };
  };
}
