{
  description = "Starting flake into the rabbit hole of flakes and folders";
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      stylix,
      aagl,
      kickstart-nixvim,
      vicinae,
      nix-cachyos-kernel,
      ...
    }:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "cocytus";
        timezone = "Asia/Singapore";
        locale = "en_SG.UTF-8";
        gpuType = "nvidia";
      };

      userSettings = {
        username = "stalkingwolf";
        name = "Stalkingwolf";
        email = "stakingwolf23@gmail.com";
        wm = "hyprland";
        wmType = "wayland";
        terminal = "ghostty";
      };

    in
    {
      nixosConfigurations = {
        cocytus = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };

          modules = [
            ./configuration.nix
            stylix.nixosModules.stylix
            {
              nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
              imports = [ aagl.nixosModules.default ];
              nix.settings = aagl.nixConfig;
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
            vicinae.homeManagerModules.default
          ];
          extraSpecialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
            inherit zen-browser;
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    kickstart-nixvim.url = "path:/home/stalkingwolf/kickstart.nixvim/";
    hardware.url = "github:NixOS/nixos-hardware/master";
    vicinae.url = "github:vicinaehq/vicinae";
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
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.niri-unstable.follows = "niri-unstable";
    };
  };
}
