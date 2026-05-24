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
    ffmpeg
    killall
    egl-wayland
    brightnessctl
    samrewritten
    catppuccin-papirus-folders
    app2unit
    deepfilternet
    bluetui

    (pkgs.callPackage ./pkgs/dmemcg-booster.nix { })
    (pkgs.callPackage ./pkgs/plasma-foreground-booster.nix {
      kcgroups = pkgs.callPackage ./pkgs/kcgroups.nix { };
    })
    (pkgs.callPackage ./pkgs/kcgroups.nix { }) # not sure if this one is needed...

    # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.gamemode.enable = true;

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.dconf.enable = true;
}
