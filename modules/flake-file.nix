{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.flake-file.flakeModules.tack
    inputs.flake-parts.flakeModules.modules
  ];

  systems = [ "x86_64-linux" ];

  flake-file.inputs = {
    flake-file.url = "github:denful/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    tack.url = "github:manic-systems/tack";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
      packages.write-tack = config.flake-file.apps.write-tack pkgs;
    };
}
