{ inputs, ... }:

{
  flake-file.inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.secrets =
    { config, pkgs, ... }:
    let
      user = "stalkingwolf";
    in
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops = {
        defaultSopsFile = ./secrets.yaml;
        defaultSopsFormat = "yaml";
        age.keyFile = "/persist/secrets/age/keys.txt";

        secrets = {
          password_hash.neededForUsers = true;

          github_token.owner = "${user}";
          lastfm_key.owner = "${user}";
          lastfm_secret.owner = "${user}";
          listenbrainz.owner = "${user}";

          ssh_id_ed25519 = {
            owner = "${user}";
            path = "/home/${user}/.ssh/id_ed25519";
            mode = "0600";
          };
        };
      };

      nix.extraOptions = "!include ${config.sops.secrets.github_token.path}";

      environment.systemPackages = with pkgs; [
        age
        sops
      ];
    };
}
