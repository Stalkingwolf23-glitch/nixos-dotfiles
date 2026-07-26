{
  inputs,
  userSettings,
  config,
  flakeInputs,
  recursivelyImport,
  ...
}:

{
  imports = [
    flakeInputs
  ]
  ++ recursivelyImport [ ./user ];

  nixpkgs.overlays = [
    (import ./overlays/rgd.nix inputs)
    (import ./overlays/gallery-dl.nix inputs)
  ];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/" + userSettings.username;

    stateVersion = "26.05";
  };

  home.file = {
    ".config/niri" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/${userSettings.username}/local/nixos/modules/assets/config/niri";
    };

    ".config/noctalia-settings.toml".source = ./assets/config/noctalia.toml;

    ".config/equibop/themes" = {
      recursive = true;
      source = ./assets/config/vesktop;
    };

    ".local/share/avatars" = {
      recursive = true;
      source = ./assets/avatars;
    };

    ".config/rofi" = {
      recursive = true;
      source = ./assets/config/rofi;
    };

    ".local/bin" = {
      recursive = true;
      source = ./assets/config/scripts;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
