{self, ...}: {
  flake.modules.nixos.spindle = {inputs, pkgs, ...}: {
  services.navidrome.withPlugins = _: [
      inputs.nix-assets.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    virtualisation.oci-containers = {
      backend = "podman";

      containers.spindle = {
        image = "ghcr.io/xmorose/spindle:v0.4.3";
        ports = ["127.0.0.1:3590:3590"];
        environmentFiles = ["/var/lib/spindle/spindle.env"];

        environment = {
          WEB_DIR = "/app/web";
          STATS_DB_PATH = "/app/data/stats.db";
          COVER_CACHE_DIR = "/app/data/covers";
          NAVIDROME_DB_PATH = "/nddata/navidrome.db";

          DEFAULT_USER = "stalkingwolf";
          NAVIDROME_USER="stalkingwolf";
          NAVIDROME_URL="https://navidrome.tail090b60.ts.net";

          AUTH_ENABLED="***";
          AUTH_COOKIE_SECURE="***";
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
  };

  flake.modules.services.imports = [self.modules.nixos.spindle];

  flake.modules.nixos.spindle-secrets = {
    security.nix-secrets.secrets = {
    	spindle-env.recipients = ["naraka"];
    };
  };

  flake.modules.nixos.naraka-secrets.imports = [self.modules.nixos.spindle-secrets];
}
