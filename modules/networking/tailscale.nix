{ self, ... }:

{
  flake.modules.nixos.tailscale = { pkgs, ... }: {
    services.tailscale = {
      enable = true;
    };
  };

  flake.modules.nixos.networking.imports = [ self.modules.nixos.tailscale ];
}
