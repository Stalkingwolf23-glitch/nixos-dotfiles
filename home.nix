{ config, pkgs, userSettings, flake, ... }:

{

  imports = [
    ./user/shell/cli.nix
    ./user/shell/sh.nix
    ./user/shell/tmux.nix
    ./user/shell/starship.nix
    ./user/shell/nh.nix
    ./user/shell/git.nix
    ./user/app/browser/zen.nix
    ./user/app/editor/vscode.nix
    ./user/app/games/lutris.nix
    ./user/app/games/mangohud.nix
    ./user/app/terminal/foot.nix
    ./user/app/runner/fuzzel.nix
    ./user/app/vesktop/vesktop.nix
    ./user/hardware/bluetooth.nix
    ./user/hyprland/hyprland.nix
    ./user/style/stylix.nix
  ];
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh
    alacritty
    git
    syncthing
    mangohud
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/user/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
