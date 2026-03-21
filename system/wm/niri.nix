{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.niri.nixosModules.default ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri-nix ];

  programs.niri = {
    enable = true;
    # package = pkgs.niri-unstable;
    package = inputs.niri-blur.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      common.default = [ "gnome" ];
    };
  };
}
