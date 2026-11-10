{
  self,
  user,
  ...
}: {
  flake.modules.homeManager.cocytus-user = {
    imports = with self.modules.homeManager; [
      zed
      desktop
      applications
      compositor
      gaming
      syncthing
    ];

    home.stateVersion = "26.05";

    programs.home-manager.enable = true;
    home.shellAliases.update = "z ~/local/nixos && git add --intent-to-add . && nh os switch --build-host=${user}@naraka";
    home.shellAliases.penis = "z ~/local/nixos && pnix";
  };

  flake.modules.nixos.home-preservation = {
    preservation.preserveAt."/persist".users.${user} = {
      directories = [
        "Downloads"
        "Documents"
        "Pictures"
        "Videos"
        "local"
        ".ssh"
      ];
    };
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.home-preservation];
}
