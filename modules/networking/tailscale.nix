{ self, ... }:

{
  flake.modules.nixos.tailscale = { pkgs, ... }: {
    services.tailscale = {
      enable = true;
    };

    boot.kernelModules = [ "tun" ];
    systemd.services.tailscaled.serviceConfig.ExecStartPre = "${pkgs.kmod}/bin/modprobe tun";
  };

  flake.modules.nixos.networking.imports = [ self.modules.nixos.tailscale ];

  flake.modules.nixos.tailscale-preservation = {
    preservation.preserveAt."/persist".directories = [
      "/var/lib/tailscale"
    ];
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.tailscale-preservation ];
}
