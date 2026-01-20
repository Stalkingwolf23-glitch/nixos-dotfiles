{ userSettings, ... }:

{

  imports = [
    ./user/shell
    ./user/app
    ./user/wm

    ./user/hardware/bluetooth.nix
    ./user/hardware/pipewire.nix
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
