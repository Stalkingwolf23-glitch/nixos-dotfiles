{ self, ... }:

{
  flake.modules.nixos.firewall = {
    networking.firewall.enable = true;
  };

  flake.modules.nixos.security.imports = [
    self.modules.nixos.firewall
  ];
}
