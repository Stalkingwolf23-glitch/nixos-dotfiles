{ inputs, ... }:

{
  imports = [
    inputs.flake-file.flakeModules.tack
    inputs.flake-file.flakeModules.dendritic
  ];

  systems = [ "x86_64-linux" ];

  flake-file.tack.allFollow = {
    home-manager = "home-manager";
    nixpkgs = [ "nixpkgs-nixcord" ];
    nixpkgs-lib = "nixpkgs-lib";
  };

  flake-file.inputs = {
    flake-file.url = "github:denful/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    preservation = {
      url = "github:nix-community/preservation";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tack.url = "github:manic-systems/tack";
    nixpkgs.url = "github:NixOS/nixpkgs/2fcb964de67fcf60b43471c55d5d99e61a9ccb5a";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake-file.tack.package = pkgs: inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default;

  perSystem =
    { system, pkgs, ... }:
    {
      _module.args.pkgs = inputs.nixpkgs.legacyPackages.${system};
      devShells.default = pkgs.mkShell {
        packages = [ inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default ];
      };
    };
}
