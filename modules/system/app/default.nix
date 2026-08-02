{ pkgs, inputs, ... }:

{
  nix.settings.extra-substituters = [ "https://nix-gaming.cachix.org" ];
  nix.settings.extra-trusted-public-keys = [
    "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
  ];

  environment.systemPackages = with pkgs; [
    wineWow64Packages.staging
    winetricks
    protonplus
    protontricks
    gamemode

    cachix
    xdg-utils
    wget
    zsh
    git
    home-manager
    wpa_supplicant
    nextdns
    ffmpeg
    killall
    egl-wayland
    brightnessctl
    samrewritten
    catppuccin-papirus-folders
    deepfilternet
    inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.gamemode.enable = true;

  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.dconf.enable = true;

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  documentation = {
    enable = false;

    dev = {
      enable = false;
    };

    doc = {
      enable = false;
    };

    info = {
      enable = false;
    };

    man = {
      enable = false;
    };

    nixos = {
      enable = false;
    };
  };
}
