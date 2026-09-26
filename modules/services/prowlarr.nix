{self, ...}: {
  flake.modules.nixos.prowlarr = {
    services.prowlarr = {
      enable = true;
      openFirewall = true;
      settings.server = {
        urlbase = "localhost";
        port = 9696;
        bindadress = "*";
      };
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.prowlarr];
}
