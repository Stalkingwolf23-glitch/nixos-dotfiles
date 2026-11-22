{self, ...}: {
  pins.nixpkgs-nitter = {
    url = "https://github.com/NixOS/nixpkgs";
    rev = "c17757c80527f4688a30b7fcded6df83b0f282a3";
  };

  flake.modules.nixos.nitter = { config, pkgs, inputs, ... }: {
    services.nitter = {
      enable = true;
      package = inputs.nixpkgs-nitter.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nitter;
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
    systemd.services.nitter.serviceConfig = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
    services.tailscale.localServe.nitter = 8080;
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.nitter];

  flake.modules.nixos.nitter-secrets = {
    security.nix-secrets.secrets = {
      "nitter-sessions.jsonl".recipients = ["naraka"];
    };
  };

  flake.modules.nixos.naraka-secrets.imports = [self.modules.nixos.nitter-secrets];
}