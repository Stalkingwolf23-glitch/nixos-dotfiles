{ self, ... }:

{
  flake.modules.nixos.nitter = { config, ... }: {
    services.nitter = {
      enable = true;
      openFirewall = false;
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
  };

  flake.modules.nixos.services.imports = [ self.modules.nixos.nitter ];
}
