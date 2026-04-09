{ userSettings, ... }:

{
  imports = [
    ./user/shell
    ./user/app
    ./user/style
  ];

  nixpkgs.overlays = [
    (import ./overlays/rgd.nix)
  ];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/" + userSettings.username;

    stateVersion = "26.05";
  };

  home.file.".config/User-dirs.dirs".text = ''
    XDG_DESKTOP_DIR = "$HOME";
  '';

  home.file.".config/niri/config.kdl".source = ./assets/config/niri.kdl;
  home.file.".config/equibop/themes".recursive = true;
  home.file.".config/equibop/themes".source = ./assets/config/vesktop;
  home.file.".config/fastfetch/compact.jsonc".source = ./assets/config/compact.jsonc;
  home.file.".config/fastfetch/fetch.jsonc".source = ./assets/config/fetch.jsonc;
  home.file.".local/share/avatars".recursive = true;
  home.file.".local/share/avatars".source = ./assets/avatars;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
