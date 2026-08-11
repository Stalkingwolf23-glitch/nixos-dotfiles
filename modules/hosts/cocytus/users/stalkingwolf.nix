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
}
