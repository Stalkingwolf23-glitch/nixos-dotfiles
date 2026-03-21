{ pkgs, ... }:

{

  imports = [
    ./steam.nix
    ./syncthing.nix
  ];

  environment.systemPackages = with pkgs; [
    wineWow64Packages.staging
    winetricks
    protonup-qt
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
    networkmanagerapplet
    ffmpeg
    killall
    egl-wayland
    brightnessctl
    samrewritten
    catppuccin-papirus-folders
    app2unit
    deepfilternet
    evtest
  ];

  programs.gamemode.enable = true;

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.dconf.enable = true;
}
