{ self, ... }:

{
  flake.modules.nixos.firewall = {
    networking.firewall.enable = true;
  };

  flake.modules.nixos.common.imports = [
    self.modules.nixos.firewall
  ];
}
