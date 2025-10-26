{ userSettings, ... }:

{

  imports = [
    ./user/shell/term.nix
    ./user/shell/cli.nix
    ./user/shell/sh.nix
    ./user/shell/starship.nix
    ./user/shell/fetch.nix
    ./user/shell/nh.nix
    ./user/shell/git.nix
    ./user/shell/yazi.nix

    ./user/app/zen.nix
    ./user/app/lutris.nix
    ./user/app/mangohud.nix
    # ./user/app/dolphin.nix
    ./user/app/nvim.nix
    ./user/app/obsidian.nix
    ./user/app/rofi.nix

    ./user/hardware/bluetooth.nix
    ./user/hyprland/hyprland.nix

    ./user/stylix.nix
  ];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/" + userSettings.username;

    stateVersion = "25.05";
    sessionPath = [
      "$HOME/local/scripts"
    ];
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
