{
  self,
  ...
}:

{
  flake.modules.homeManager.noctalia = {
    programs.noctalia = {
      enable = true;
    };
  };

  flake.modules.homeManager.compositor.imports = [
    self.modules.homeManager.noctalia
  ];

  flake.modules.nixos.noctalia-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [ ".local/state/noctalia" ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.noctalia-preservation ];
}
