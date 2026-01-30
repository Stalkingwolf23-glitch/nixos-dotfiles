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

    ./system/hardware/bluetooth.nix
    ./system/hardware/keyboard.nix
    ./system/hardware/kernel.nix
    ./system/hardware/nvidia.nix
    ./system/hardware/network.nix
    ./system/hardware/systemd.nix
    ./system/hardware/time.nix

    ./system/wm
    ./system/security
    ./system/style

    ./system/app/steam.nix
    ./system/app/gamemode.nix
    ./system/app/wine.nix
    ./system/app/syncthing.nix

    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.hardware.nixosModules.common-pc-ssd
  ];

  nixpkgs.overlays = [
    (import ./overlays/python.nix) # Overlay to skip test temp until patched
    (import ./overlays/dolphin.nix)
  ];

  # Environmental Variables
  environment.sessionVariables = {
    NH_FLAKE = "/home/${userSettings.username}/nixos";
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
    # Nvidia Junk
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_VRR_ALLOWED = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_DRM_NO_ATOMIC = "1";
    # QT
    QT_STYLE_OVERRIDE = "kvantum";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };
  # Optimization
  nix.optimise.automatic = true;

  nix.settings = {
    # Cachix to skip compiling heavier programs
    substituters = [
      "https://ezkea.cachix.org"
      "https://attic.xuyh0120.win/lantian"
    ];
    extra-substituters = [ "https://vicinae.cachix.org" ];

    trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
    extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];

    # Enable flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  environment.systemPackages = with pkgs; [
    cachix
    wget
    zsh
    git
    home-manager
    wpa_supplicant
    nextdns
    networkmanagerapplet
    ffmpeg
    killall
    egl-wayland
    nixfmt-rfc-style
    brightnessctl
    samrewritten
    catppuccin-papirus-folders
    app2unit
    deepfilternet
  ];

  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

  # zsh
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Easyeffect
  programs.dconf.enable = true;

  # RAM Stuff
  services.earlyoom.enable = true;
  services.earlyoom.freeSwapThreshold = 2;
  services.earlyoom.freeMemThreshold = 2;
  zramSwap.enable = true;

  # Security
  security.polkit.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "25.05"; # Did you read the comment? Did you?
}
