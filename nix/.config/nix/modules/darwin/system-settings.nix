{
  pkgs,
  lib,
  config,
  ...
}:
{
  system = {
    primaryUser = "${config.my.primaryUser}";
    defaults = {
      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
      };
      dock = {
        autohide = true;
        orientation = "right";
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    activationScripts.activateSymbolicHotKeys.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
  };
}
