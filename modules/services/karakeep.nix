{self, ...}: {
  flake.modules.nixos.karakeep = {
    services.karakeep = {
      enable = true;
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.karakeep];
}
