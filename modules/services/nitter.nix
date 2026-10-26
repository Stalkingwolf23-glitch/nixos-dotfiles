{self, ...}: {
  flake.modules.nixos.nitter = {
    config,
    lib,
    pkgs,
    ...
  }: {
    services.nitter = {
      enable = true;
      redisCreateLocally = true;
      sessionsFile = config.security.nix-secrets.secrets."nitter-sessions.jsonl".path;
      preferences = {
        autoplayGifs = false;
        hideTweetStats = true;
      };
      server = {
        address = "127.0.0.1";
        port = 8080;
        hostname = "Nitter";
        https = false;
      };
    };

    services.tailscale.extraUpFlags = ["--advertise-tags=tag:nitter"];
    systemd.services = {
      nitter.serviceConfig = {
        Restart = "on-failure";
        RestartSec = "5s";
      };
      tailscale-nitter = {
        wantedBy = ["multi-user.target"];
        wants = [
          "tailscaled.service"
          "nitter.service"
        ];
        after = [
          "tailscaled.service"
          "tailscaled-autoconnect.service"
          "nitter.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = lib.escapeShellArgs [
            (lib.getExe pkgs.tailscale)
            "serve"
            "--yes"
            "--bg"
            "--service=svc:nitter"
            "--https=443"
            "http://127.0.0.1:8080"
          ];
        };
      };
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.nitter];
}
