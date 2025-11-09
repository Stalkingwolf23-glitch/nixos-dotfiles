{
  inputs,
  pkgs,
  ...
}:
let
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  # Import wayland config
  imports = [
    ./wayland.nix
    ./pipewire.nix
    ./dbus.nix
    # ./sddm.nix
    ./greetd.nix
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      # pkgs.xdg-desktop-portal-gtk
    ];
  };

  xdg.menus.enable = true;
  xdg.icons.enable = true;
  xdg.mime.enable = true;
  # Security
  security = {
    pam.services.login.enableGnomeKeyring = true;
  };
  services.gnome.gnome-keyring.enable = true;

  programs = {
    hyprland = {
      withUWSM = true;
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland = {
        enable = true;
      };
      portalPackage = pkgs-hyprland.xdg-desktop-portal-hyprland;
    };
  };

  services.xserver.excludePackages = [ pkgs.xterm ];
}
