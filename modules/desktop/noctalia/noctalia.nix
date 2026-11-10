{self, ...}: {
  flake.modules.homeManager.noctalia = {
    imports = [./_settings.nix];

    programs.noctalia = {
      enable = true;
    };
  };

  flake.modules.homeManager.compositor.imports = [
    self.modules.homeManager.noctalia
  ];

  flake.modules.nixos.noctalia-preservation = {user, ...}: {
    preservation.preserveAt."/persist".users.${user} = {
      directories = [".local/state/noctalia"];
    };
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.noctalia-preservation];
}
