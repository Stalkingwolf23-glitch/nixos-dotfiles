{self, ...}: {
  pins.sonora.url = "https://github.com/sonorahq/sonora";

  flake.modules.homeManager.scrobbler = {
    pkgs,
    inputs,
    ...
  }: {
    imports = [inputs.sonora.homeManagerModules.default];
    home.packages = with pkgs; [nicotine-plus];

    services.rescrobbled = {
      enable = true;
      settings = {
        "lastfm-key-file" = "/run/nix-secrets/secrets/lastfm_key";
        "lastfm-secret-file" = "/run/nix-secrets/secrets/lastfm_secret";
        "listenbrainz-token-file" = "/run/nix-secrets/secrets/listenbrainz";

        "use-track-start-timestamp" = true;
        "player-ignorelist" = ["zen.*"];
      };
    };

    programs.sonora = {
      enable = true;
    };
  };

  flake.modules.homeManager.applications.imports = [self.modules.homeManager.scrobbler];

  flake.modules.nixos.music-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [
        ".config/MusicBrainz"
        ".config/rescrobbled"
        ".config/nicotine"
        ".local/share/nicotine/incomplete"
        ".config/sonora"
        ".local/share/sonora"
        ".cache/sonora/youtube"
        ".cache/sonora/subsonic"
      ];
      files = [
        ".local/share/nicotine/downloads.json"
        ".local/share/nicotine/uploads.json"
        ".local/share/nicotine/wishlist.json"
      ];
    };
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.music-preservation];

  flake.modules.nixos.music-secrets = {
    security.nix-secrets.secrets = {
      lastfm_key = {
        recipients = ["cocytus"];
        owner = "stalkingwolf";
      };
      lastfm_secret = {
        recipients = ["cocytus"];
        owner = "stalkingwolf";
      };
      listenbrainz = {
        recipients = ["cocytus"];
        owner = "stalkingwolf";
      };
    };
  };

  flake.modules.nixos.cocytus-secrets.imports = [self.modules.nixos.music-secrets];
}
