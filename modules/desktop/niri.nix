{ self, ... }:

{
  flake-file.inputs = {
    niri-unstable.url = "github:YaLTeR/niri";
    niri = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.niri-unstable.follows = "niri-unstable";
    };
    niri-screenshare = {
      url = "github:pantarune/niri-screenshare";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixos.niri =
    {
      config,
      inputs,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [ inputs.niri.nixosModules.niri-nix ];

      config = lib.mkIf (config.compositor == "niri") {
        nix.settings.extra-substituters = [ "https://niri-nix.cachix.org" ];
        nix.settings.extra-trusted-public-keys = [
          "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
        ];

        nixpkgs.overlays = [ inputs.niri.overlays.niri-nix ];

        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;
        };

        xdg.portal = {
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            inputs.niri-screenshare.packages.${pkgs.stdenv.hostPlatform.system}.default
          ];
          config = {
            common.default = [ "gtk" ];
            common."org.freedesktop.impl.portal.ScreenCast" = [ "niri" ];
          };
        };

        environment.systemPackages = [ pkgs.xwayland-satellite ];
      };
    };

  flake.modules.nixos.compositor.imports = [ self.modules.nixos.niri ];

  flake.modules.homeManager.niri =
    { config, lib, ... }:
    {
      config = lib.mkIf (config.compositor == "niri") {
        home.file.".config/niri".source =
          config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/local/nixos/modules/assets/config/niri";
      };
    };

  flake.modules.homeManager.compositor.imports = [
    self.modules.homeManager.niri
  ];
}
