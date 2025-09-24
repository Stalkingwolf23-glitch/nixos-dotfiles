{ config, pkgs, systemSettings, userSettings, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./system/hardware-configuration.nix

      ./system/hardware/bluetooth.nix
      ./system/hardware/kernel.nix
      ./system/hardware/nvidia.nix
      ./system/hardware/network.nix
      ./system/hardware/systemd.nix
      ./system/hardware/time.nix

      ./system/wm/hyprland.nix

      ./system/app/steam.nix
      ./system/app/gamemode.nix
      ./system/app/wine.nix
      ./system/app/syncthing.nix

      ./system/security/automount.nix
      ./system/security/doas.nix
      ./system/security/user.nix
      ./system/security/firejail.nix
      ./system/security/firewall.nix
      ./system/security/gpg.nix

      ./system/style/stylix.nix
    ];

  nixpkgs.overlays = [
    (import ./overlays/python.nix)   # Overlay to skip test temp until patched
    (import ./overlays/dolphin.nix)
  ];

  # Environmental Variables
  environment.sessionVariables = rec {
    NH_FLAKE = "/home/${userSettings.username}/nixos";
    NIXOS_OZONE_WL = "1";
  };
  # Optimization
  nix.optimise.automatic = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
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
    deepfilternet
    p7zip
    brightnessctl
    samrewritten
    catppuccin-papirus-folders
    steamtinkerlaunch
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