{ self, ... }:
{
  flake.modules.homeManager.cocytus-stalkingwolf = {
    imports = with self.modules.homeManager; [
      terminal
      nvim
      desktop
      applications
      compositor
      gaming
      syncthing
    ];

    home = {
      username = "stalkingwolf";
      homeDirectory = "/home/stalkingwolf";
      stateVersion = "26.05";
    };

    programs.home-manager.enable = true;
  };

  flake.modules.nixos.home-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [
        "Downloads"
        "Documents"
        "Pictures"
        "Videos"
        "local"
        ".ssh"
      ];

      files = [ ".zsh_history" ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.home-preservation ];
}
