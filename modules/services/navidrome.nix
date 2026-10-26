{self, ...}: {
  flake.modules.nixos.navidrome = {
    lib,
    pkgs,
    ...
  }: {
    services.navidrome = {
      enable = true;
      settings = {
        Address = "127.0.0.1";
        Port = 4533;
        MusicFolder = "/raurava/music";
        Plugins.Enabled = false;
      };
    };

    services.tailscale.extraUpFlags = ["--advertise-tags=tag:navidrome"];
    systemd.services = {
      navidrome.serviceConfig = {
        Restart = "on-failure";
        RestartSec = "5s";
      };
      tailscale-navidrome = {
        wantedBy = ["multi-user.target"];
        wants = [
          "tailscaled.service"
          "navidrome.service"
          "tailscale-nitter.service"
        ];
        after = [
          "tailscaled.service"
          "tailscaled-autoconnect.service"
          "navidrome.service"
          "tailscale-nitter.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = lib.escapeShellArgs [
            (lib.getExe pkgs.tailscale)
            "serve"
            "--yes"
            "--bg"
            "--service=svc:navidrome"
            "--https=443"
            "http://127.0.0.1:4533"
          ];
        };
      };
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.navidrome];
}
