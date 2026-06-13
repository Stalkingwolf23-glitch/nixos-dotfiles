{
  userSettings,
  config,
  recursivelyImport,
  ...
}:

{
  imports = recursivelyImport [
    ./user
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

  # home.file.".config/niri".recursive = true;
  # home.file.".config/niri".source = ./assets/config/niri;
  home.file.".config/noctalia/palettes/CatppuccinBlue.json".source =
    ./assets/config/noctalia/palettes/CatppuccinBlue.json;
  home.file.".config/noctalia/noctalia-settings.toml".source = ./assets/config/noctalia/noctalia.toml;

  home.file.".config/equibop/themes".recursive = true;
  home.file.".config/equibop/themes".source = ./assets/config/vesktop;

  home.file.".config/fastfetch/compact.jsonc".source = ./assets/config/compact.jsonc;
  home.file.".config/fastfetch/fetch.jsonc".source = ./assets/config/fetch.jsonc;

  home.file.".local/share/avatars".recursive = true;
  home.file.".local/share/avatars".source = ./assets/avatars;

  home.file.".config/rmpc".recursive = true;
  home.file.".config/rmpc".source = ./assets/config/rmpc;

  home.file.".config/zen/default/chrome/userChrome.css".source =
    config.lib.file.mkOutOfStoreSymlink "/home/${userSettings.username}/local/nixos/assets/zen/userChrome.css";

  home.file.".config/rofi".recursive = true;
  home.file.".config/rofi".source = ./assets/config/rofi;

  home.file.".local/bin".recursive = true;
  home.file.".local/bin".source = ./assets/config/scripts;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
