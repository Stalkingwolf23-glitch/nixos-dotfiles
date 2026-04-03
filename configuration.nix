{
  pkgs,
  userSettings,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./system/hardware-configuration.nix

    ./system/hardware
    ./system/wm
    ./system/security
    ./system/style
    ./system/app

    inputs.hardware.nixosModules.common-pc-ssd
  ];

  nixpkgs.overlays = [
    (import ./overlays/python.nix) # Overlay to skip test temp until patched
  ];

  # Environmental Variables
  environment.sessionVariables = {
    NH_FLAKE = "/home/${userSettings.username}/nixos";
    NIXOS_OZONE_WL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    EDITOR = "nvim";
    APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
    # QT
    QT_STYLE_OVERRIDE = "kvantum";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    # XDG
  };
  # Optimization
  nix.optimise.automatic = true;

  nix.settings = {
    # Cachix to skip compiling heavier programs
    substituters = [
      "https://ezkea.cachix.org"
      "https://attic.xuyh0120.win/lantian"
      "https://niri-nix.cachix.org"
    ];
    extra-substituters = [ "https://vicinae.cachix.org" ];

    trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
    ];
    extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];

    # Enable flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "26.05"; # Did you read the comment? Did you?
}
