{self, ...}: {
  flake.modules.nixos.lidarr = {
    lib,
    pkgs,
    ...
  }: {
    services.lidarr = {
      enable = true;
      port = "8686";
    };

    services.tailscale.extraUpFlags = ["--advertise-tags=tag:lidarr"];
    systemd.services = {
      lidarr.serviceConfig = {
        Restart = "on-failure";
        RestartSec = "5s";
      };
      tailscale-lidarr = {
        wantedBy = ["multi-user.target"];
        wants = ["tailscaled.service"];
        after = [
          "tailscaled.service"
          "tailscaled-autoconnect.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = lib.escapeShellArgs [
            (lib.getExe pkgs.tailscale)
            "serve"
            "--yes"
            "--bg"
            "--service=svc:lidarr"
            "--https=443"
            "http://127.0.0.1:8686"
          ];
        };
      };
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.lidarr];
}
