{
  inputs,
  pkgs,
  userSettings,
  ...
}:

{
  flake-file.inputs.sops-nix.url = "github:Mic92/sops-nix";

  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${userSettings.username}/.config/sops/age/keys.txt";

    secrets = {
      github_token = {
        owner = userSettings.username;
      };

      ssh_id_ed25519 = {
        owner = userSettings.username;
        path = "/home/${userSettings.username}/.ssh/id_ed25519";
        mode = "0600";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    age
    sops
  ];
}
