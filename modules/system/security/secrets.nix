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

    secrets.github_token = {
      owner = userSettings.username;
    };

  };

  environment.systemPackages = with pkgs; [
    age
    sops
  ];
}
