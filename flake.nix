{
  description = "Starting flake into the rabbit hole of flakes and folders";
  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      zen-browser,
      stylix,
      aagl,
      nix-cachyos-kernel,
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

      lib = inputs.nixpkgs.lib;
      recursivelyImport = import ./lib/recursivelyImport.nix { inherit lib; };

    in
    {
      nixosConfigurations = {
        cocytus = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
            inherit nix-cachyos-kernel;
            inherit recursivelyImport;
          };

          modules = [
            ./configuration.nix
            stylix.nixosModules.stylix
            {
              imports = [ aagl.nixosModules.default ];
              nix.settings = aagl.nixConfig // {
                warn-dirty = false;
                extra-substituters = (aagl.nixConfig.extra-substituters or [ ]) ++ [
                  "https://ezkea.cachix.org" # AAGL cache
                  "https://attic.xuyh0120.win/lantian" # cachy kernel cache
                  "https://niri-nix.cachix.org" # niri-nix cache
                  "https://noctalia.cachix.org" # noctalia cache
                ];
                extra-trusted-public-keys = (aagl.nixConfig.extra-trusted-public-keys or [ ]) ++ [
                  "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
                  "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
                  "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
                  "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
                ];
              };
              programs.honkers-railway-launcher.enable = true;
              programs.honkers-launcher.enable = true;
            }
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
          extraSpecialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
            inherit zen-browser;
            inherit recursivelyImport;
          };
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
