{ inputs, ... }:

{
  flake-file.inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.secrets =
    { config, pkgs, ... }:
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops = {
        defaultSopsFile = ./secrets.yaml;
        defaultSopsFormat = "yaml";
        age.keyFile = "/home/stalkingwolf/.config/sops/age/keys.txt";

        secrets = {
          github_token = {
            owner = "stalkingwolf";
          };

          ssh_id_ed25519 = {
            owner = "stalkingwolf";
            path = "/home/stalkingwolf/.ssh/id_ed25519";
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
