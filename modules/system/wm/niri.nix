{
  pkgs,
  inputs,
  systemSettings,
  ...
}:

{
  flake-file.inputs = {
    niri-unstable.url = "github:YaLTeR/niri";
    niri = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.niri-unstable.follows = "niri-unstable";
    };
    niri-screenshare.url = "github:pantarune/niri-screenshare";
  };

  nix.settings.extra-substituters = [ "https://niri-nix.cachix.org" ];
  nix.settings.extra-trusted-public-keys = [
    "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
  ];

  imports = [ inputs.niri.nixosModules.niri-nix ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri-nix ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      inputs.niri-screenshare.packages.${systemSettings.system}.default
    ];
    config = {
      common.default = [ "gtk" ];
      common."org.freedesktop.impl.portal.ScreenCast" = [ "niri" ];
    };
  };
}
