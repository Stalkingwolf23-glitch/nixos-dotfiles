{
  description = "Starting flake into the rabbit hole of flakes and folders";

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      hyprland,
      zen-browser,
      stylix,
      aagl,
      kickstart-nixvim,
      vicinae,
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
        terminal = "kitty";
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
              imports = [ aagl.nixosModules.default ];
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
    millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium";
    vicinae.url = "github:vicinaehq/vicinae";

    home-manager = {
      url = "github:nix-community/home-manager";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
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
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
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
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell"; # Use same quickshell version
    };
  };
}
