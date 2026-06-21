{
  inputs,
  recursivelyImport,
  ...
}:

{
  imports = recursivelyImport [
    # Include the results of the hardware scan.
    ./system/hardware-configuration.nix

    ./system

    inputs.hardware.nixosModules.common-pc-ssd
  ];

  # Environmental Variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    EDITOR = "nvim";
    APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
    # QT
    QT_STYLE_OVERRIDE = "kvantum";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  # Optimization
  nix.optimise.automatic = true;

  nix.settings = {
    # Enable flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "26.05"; # Did you read the comment? Did you?
}
