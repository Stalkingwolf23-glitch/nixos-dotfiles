{ pkgs, inputs, ... }:

{
  imports = [ inputs.niri.nixosModules.niri ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  niri-flake.cache.enable = true;

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    # config = ''
    #   ${builtins.readFile ../../assets/config/niri.kdl}
    # '';
  };

  xdg.portal = {
    enable = true;
    config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
