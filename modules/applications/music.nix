{ self, ... }:

{
  flake.modules.homeManager.scrobbler = { pkgs, ... }: {
    home.packages = [ pkgs.lollypop ];

    services.rescrobbled = {
      enable = true;
      settings = {
        "lastfm-key-file" = "/run/nix-secrets/secrets/lastfm_key";
        "lastfm-secret-file" = "/run/nix-secrets/secrets/lastfm_secret";
        "listenbrainz-token-file" = "/run/nix-secrets/secrets/listenbrainz";

        "use-track-start-timestamp" = true;
        "player-ignorelist" = [ "zen.*" ];
      };
    };
  };

  flake.modules.homeManager.applications.imports = [ self.modules.homeManager.scrobbler ];

  flake.modules.nixos.music-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [
        ".config/rescrobbled"
      ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.music-preservation ];

}
