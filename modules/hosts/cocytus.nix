{ self, ... }:

{
  flake.modules.nixos.cocytus = {
    imports = with self.modules.nixos; [
      chaotic
      settings
      hardware-configuration
      hardware
      storage
      kernel
      keyboard
      performance
      time
      networking
      syncthing
      security
      hardening
      secrets
      defaults
      desktop
      pipewire
      niri
      noctalia
      greeter
      steam
      aagl
    ];

    networking.hostName = "cocytus";

    users.users.stalkingwolf = {
      isNormalUser = true;
      # description = "Stalkingwolf";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
      ];
    };

    nix.settings.trusted-users = [ "@wheel" ];
  };

  flake.modules.homeManager.stalkingwolf = {
    imports = with self.modules.homeManager; [
      terminal
      zen
      nixcord
      dolphin
      aiTool
      xdg
      editor
      style
      niri
      noctalia
      misc
      gameLauncher
      mangohud
    ];

    home = {
      username = "stalkingwolf";
      homeDirectory = "/home/stalkingwolf";
      stateVersion = "26.05";
    };

    home.file = {
      ".local/share/avatars" = {
        recursive = true;
        source = ../assets/avatars;
      };

      ".local/bin" = {
        recursive = true;
        source = ../assets/config/scripts;
      };
    };

    programs.home-manager.enable = true;
  };
}
