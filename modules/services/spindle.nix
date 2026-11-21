{self, ...}: {
  flake.modules.nixos.spindle = {
    inputs,
    config,
    pkgs,
    lib,
    ...
  }: {
    services.navidrome.withPlugins = _: [
      inputs.nix-assets.packages.${pkgs.stdenv.hostPlatform.system}.spindle
    ];
    virtualisation.oci-containers = {
      backend = "podman";

      containers.spindle = {
        image = "ghcr.io/xmorose/spindle:0.4.3";
        ports = ["127.0.0.1:3590:3590"];
        environmentFiles = [config.security.nix-secrets.secrets.spindle-env.path];

        environment = {
          WEB_DIR = "/app/web";
          STATS_DB_PATH = "/app/data/stats.db";
          COVER_CACHE_DIR = "/app/data/covers";
          NAVIDROME_DB_PATH = "/nddata/navidrome.db";

          DEFAULT_USER = "stalkingwolf";
          NAVIDROME_USER = "stalkingwolf";
          NAVIDROME_URL = "https://navidrome.tail090b60.ts.net";

          AUTH_ENABLED = "true";
          AUTH_COOKIE_SECURE = "true";
          TRUST_PROXY = "true";
          SESSION_DAYS = "30";
        };

        volumes = [
          "/var/lib/spindle/data:/app/data"
          "/var/lib/navidrome:/nddata"
        ];
      };
    };

    systemd.tmpfiles.rules = [
      "d /var/lib/spindle      0700 root root -"
      "d /var/lib/spindle/data 0700 root root -"
    ];

    services.tailscale.extraUpFlags = ["--advertise-tags=tag:spindle"];
    systemd.services = {
      podman-spindle.serviceConfig = {
        Restart = "on-failure";
        RestartSec = "5s";
      };
      tailscale-spindle = {
        wantedBy = ["multi-user.target"];
        wants = [
          "tailscaled.service"
          "podman-spindle.service"
          "tailscale-nitter.service"
        ];
        after = [
          "tailscaled.service"
          "tailscaled-autoconnect.service"
          "podman-spindle.service"
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
            "--service=svc:spindle"
            "--https=443"
            "http://127.0.0.1:3590"
          ];
        };
      };
    };
  };

  flake.modules.nixos.spindle-secrets = {
    security.nix-secrets.secrets = {
      spindle-env.recipients = ["naraka"];
    };
  };

  flake.modules.nixos.naraka-secrets.imports = [self.modules.nixos.spindle-secrets];
}
