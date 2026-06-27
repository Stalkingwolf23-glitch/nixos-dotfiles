{ inputs, config, ... }:
{
  imports = [ inputs.flake-file.flakeModules.tack ];

  systems = [ "x86_64-linux" ];

  flake-file.inputs = {
    flake-file.url = "github:denful/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    tack.url = "github:manic-systems/tack";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    kickstart-nixvim.url = "github:Stalkingwolf23-glitch/kickstart.nixvim";
    nixvim.url = "github:nix-community/nixvim";
    hardware.url = "github:NixOS/nixos-hardware/master";
    niri-unstable.url = "github:YaLTeR/niri";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake/beta";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    niri = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.niri-unstable.follows = "niri-unstable";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
  };

  flake-file.tack.package = pkgs: inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default;

  flake-file.tack.allFollow = {
    nixpkgs = [
      "nixpkgs"
      "noctalia"
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
