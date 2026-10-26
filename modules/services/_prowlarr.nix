{self, ...}: {
  flake.modules.nixos.prowlarr = {
    lib,
    pkgs,
    ...
  }: {
    services.prowlarr = {
      enable = true;
      openFirewall = true;
      settings.server = {
        urlbase = "localhost";
        port = 9696;
        bindadress = "*";
      };
    };

    services.tailscale.extraUpFlags = ["--advertise-tags=tag:prowlarr"];
    systemd.services = {
      prowlarr.serviceConfig = {
        Restart = "on-failure";
        RestartSec = "5s";
      };
      tailscale-prowlarr = {
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
            "--service=svc:prowlarr"
            "--https=443"
            "http://127.0.0.1:9696"
          ];
        };
      };
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.prowlarr];
}
