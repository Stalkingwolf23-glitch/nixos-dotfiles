{ self, ... }:

{
  flake.modules.nixos.nitter = {
    services.nitter = {
      enable = true;
      openFirewall = false;
      redisCreateLocally = true;
      sessionsFile = "/home/stalkingwolf/sessions.jsonl";
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
