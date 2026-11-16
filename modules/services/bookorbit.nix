{self, ...}: {
  flake.modules.nixos.bookorbit = {
    lib,
    pkgs,
    config,
    ...
  }: {
    services.bookorbit = {
      enable = true;
      environment = {
        HOST = "127.0.0.1";
        PORT = 3001;
      };
      environmentFile = config.security.nix-secrets.secrets.bookorbit-env.path;
    };

    users.users.bookorbit = {
      isSystemUser = true;
      group = "bookorbit";
    };
    users.groups.bookorbit = {};
    systemd.services = {
      bookorbit = {
        wantedBy = ["multi-user.target"];
        wants = ["network-online.target"];
        after = ["network-online.target"];
        serviceConfig = {
          User = "bookorbit";
          Group = "bookorbit";
          Restart = "on-failure";
          RestartSec = "5s";
        };
      };
      tailscale-bookorbit = {
        wantedBy = ["multi-user.target"];
        wants = [
          "tailscaled.service"
          "bookorbit.service"
          "tailscale-immich.service"
        ];
        after = [
          "tailscaled.service"
          "tailscaled-autoconnect.service"
          "bookorbit.service"
          "tailscale-navidrome.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          TimeoutStartSec = "120s";
          ExecStartPre = "${lib.getExe pkgs.tailscale} wait --timeout=90s";
          ExecStart = lib.escapeShellArgs [
            (lib.getExe pkgs.tailscale)
            "serve"
            "--yes"
            "--bg"
            "--service=svc:bookorbit"
            "--https=443"
            "http://127.0.0.1:3001"
          ];
        };
      };
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.bookorbit];

  flake.modules.nixos.bookorbit-secrets = {
    security.nix-secrets.secrets = {
      bookorbit-env.recipients = ["naraka"];
    };
  };

  flake.modules.nixos.naraka-secrets.imports = [ self.modules.nixos.bookorbit-secrets ];
}
