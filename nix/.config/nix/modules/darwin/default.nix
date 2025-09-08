{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    ./primary-user.nix
    ./system-keybinds.nix
    ./system-settings.nix
    ./homebrew
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  system.stateVersion = 6;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  environment.shells = [ pkgs.zsh ];
  environment.systemPackages = with pkgs; [
    nixfmt
  ];
  environment.variables.EDITOR = "nvim";

  programs.zsh = {
    enable = true;
  };

  users.users.${config.my.primaryUser} = {
    name = "${config.my.primaryUser}";
    home = "/Users/${config.my.primaryUser}";
    shell = pkgs.zsh;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  nix-homebrew = {
    enable = true;
    user = config.my.primaryUser;
  };
}
