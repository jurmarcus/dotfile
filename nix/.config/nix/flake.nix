{
  description = "methylene nix-darwin (Apple Silicon)";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      ...
    }:
    let
      system = "aarch64-darwin";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { inherit system; };

      hostNames = lib.attrNames (lib.filterAttrs (_: t: t == "directory") (builtins.readDir ./hosts));

      mkDarwinHost =
        hostName:
        nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = { inherit inputs system; };
          modules = [
            { networking.hostName = hostName; }
            ./modules/darwin
            ./hosts/${hostName}
            { system.configurationRevision = self.rev or self.dirtyRev or null; }
          ];
        };
    in
    {
      darwinConfigurations = lib.listToAttrs (
        map (hn: {
          name = hn;
          value = mkDarwinHost hn;
        }) hostNames
      );

      formatter.${system} = pkgs.nixfmt;
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.nixfmt-rfc-style
          pkgs.statix
          pkgs.deadnix
          pkgs.nixd
        ];
      };
    };
}
