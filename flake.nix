{
  description = "Starting flake into the rabbit hole of flakes and folders";

  outputs = inputs@{ 
    self, nixpkgs, home-manager, hyprland, zen-browser, stylix, aagl, ... }:
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
        terminal = "foot";
      };

    in {
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
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "HMBackup";
            }
            {
              imports = [ aagl.nixosModules.default ];
              programs.honkers-railway-launcher.enable = true;
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
    kickstart-nixvim.url = "github:Stalkingwolf23-glitch/kickstart.nixvim";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland"; # to make sure that the plugin is built for the correct version of hyprland
    };
    hyprlock = {
      type = "git";
      url = "https://code.hyprland.org/hyprwm/hyprlock.git";
      # rev = "73b0fc26c0e2f6f82f9d9f5b02e660a958902763";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
    hyprXPrimary = {
      url = "github:zakk4223/hyprXPrimary";
      inputs.hyprland.follows = "hyprland";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };
    aagl = {
     url = "github:ezKEa/aagl-gtk-on-nix";
     inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}