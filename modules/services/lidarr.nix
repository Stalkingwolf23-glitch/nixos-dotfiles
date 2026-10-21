{self, ...}: {
  flake.modules.nixos.lidarr = {
    services.lidarr = {
      enable = true;
      group = "media";
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.lidarr];
}
