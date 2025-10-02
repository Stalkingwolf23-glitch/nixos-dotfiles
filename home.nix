{ pkgs, userSettings, ... }:

{

  imports = [
    ./user/shell/cli.nix
    ./user/shell/sh.nix
    ./user/shell/tmux.nix
    ./user/shell/starship.nix
    ./user/shell/fastfetch.nix
    ./user/shell/nh.nix
    ./user/shell/git.nix
    ./user/shell/yazi.nix

    ./user/app/zen.nix
    ./user/app/vscode.nix
    ./user/app/lutris.nix
    ./user/app/mangohud.nix
    ./user/app/dolphin.nix
    ./user/app/foot.nix
    ./user/app/fuzzel.nix
    ./user/app/vesktop.nix
    ./user/app/nvim.nix

    ./user/hardware/bluetooth.nix
    ./user/hyprland/hyprland.nix

    ./user/stylix.nix
  ];
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  home.stateVersion = "25.05"; # Just don't change unless Home Manaer release notes state otherwise.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh
    alacritty
    git
    syncthing
    mangohud
    qview
  ];

  home.sessionPath = [
    "$HOME/local/scripts"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

