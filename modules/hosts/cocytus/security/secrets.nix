{
  flake-file.inputs.nix-secrets = {
    url = "github:unnamed-systems/nix-secrets";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.cocytus-secrets = { inputs, config, ... }: {
    imports = [ inputs.nix-secrets.nixosModules.default ];

    security.nix-secrets = {
      enable = true;
      storage = ../../../../secrets/cocytus;
      identityPaths = [ "/persist/secrets/age/keys.txt" ];
      recipientAliases.cocytus = "age1pn9g5yf9k6406f2h4hwjc9asr579997yxvddurljk5zq8cvmjyzsw2l77q";

      secrets = {
        github_token = {
          recipients = [ "cocytus" ];
          owner = "stalkingwolf";
        };
        password_hash = {
          recipients = [ "cocytus" ];
          neededForUsers = true;
        };
        lastfm_key = {
          recipients = [ "cocytus" ];
          owner = "stalkingwolf";
        };
        lastfm_secret = {
          recipients = [ "cocytus" ];
          owner = "stalkingwolf";
        };
        listenbrainz = {
          recipients = [ "cocytus" ];
          owner = "stalkingwolf";
        };
        ssh_id_ed25519 = {
          recipients = [ "cocytus" ];
          owner = "stalkingwolf";
          path = "/home/stalkingwolf/.ssh/id_ed25519";
          mode = "0600";
        };
      };
    };
    nix.extraOptions = "!include ${config.security.nix-secrets.secrets.github_token.path}";
  };
}
