{
  description = "Starting flake into the rabbit hole of flakes and folders";
  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      stylix,
      nix-index-database,
      ...
    }:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "cocytus";
        timezone = "Asia/Singapore";
        locale = "en_SG.UTF-8";
        gpuType = "amd";
      };

      userSettings = {
        username = "stalkingwolf";
        name = "Stalkingwolf";
        email = "stalkingwolf@cocytus.me";
        wm = "niri";
        wmType = "wayland";
        terminal = "kitty";
      };

      recursivelyImport = import ./lib/recursivelyImport.nix { lib = inputs.nixpkgs.lib; };

      commonArgs = {
        inherit
          systemSettings
          userSettings
          inputs
          recursivelyImport
          ;
      };

    in
    {
      nixosConfigurations = {
        cocytus = nixpkgs.lib.nixosSystem {
          specialArgs = commonArgs;
          modules = [
            ./configuration.nix
            stylix.nixosModules.stylix
            { nix.settings.warn-dirty = false; }
          ];
        };
      };
      homeConfigurations = {
        stalkingwolf = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./home.nix
            stylix.homeModules.stylix
            nix-index-database.homeModules.default
          ];
          extraSpecialArgs = commonArgs;
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    kickstart-nixvim.url = "path:/home/stalkingwolf/local/kickstart.nixvim/";
    hardware.url = "github:NixOS/nixos-hardware/master";
    niri-unstable.url = "github:YaLTeR/niri";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    home-manager = {
      url = "github:nix-community/home-manager";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
    };
    niri = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.niri-unstable.follows = "niri-unstable";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
