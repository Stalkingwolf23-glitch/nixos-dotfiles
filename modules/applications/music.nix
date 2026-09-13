{self, ...}: {
  flake.modules.homeManager.scrobbler = {pkgs, ...}: {
    home.packages = with pkgs; [lollypop nicotine-plus pear-desktop];

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
  };

  flake.modules.homeManager.applications.imports = [self.modules.homeManager.scrobbler];

  flake.modules.nixos.music-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [
        ".config/MusicBrainz"
        ".config/YouTube Music"
        ".config/rescrobbled"
        ".config/nicotine"
        ".local/share/nicotine/incomplete"
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
