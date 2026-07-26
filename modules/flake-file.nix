{
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.flake-file.flakeModules.tack ];

  systems = [ "x86_64-linux" ];

  flake-file.inputs = {
    flake-file.url = "github:denful/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    tack.url = "github:manic-systems/tack";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:danth/stylix";
  }
  # Allow modularity for flake-file inputs by merging the list together
  // config.flake.homeConfigurations.stalkingwolf.config.flake-file.inputs
  // config.flake.nixosConfigurations.cocytus.config.flake-file.inputs;

  flake-file.tack.package = pkgs: inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default;

  flake-file.tack.allFollow = {
    nixpkgs = [
      "nixpkgs"
      "noctalia"
      "aagl"
      "nixvim"
    ];
    niri-unstable = [ "niri-unstable" ];
    flake-parts = [ "flake-parts" ];
    nixvim = [ "nixvim" ];
  };

  perSystem =
    { system, pkgs, ... }:
    {
      _module.args.pkgs = inputs.nixpkgs.legacyPackages.${system};
      packages.write-tack = config.flake-file.apps.write-tack pkgs;
    };
}
