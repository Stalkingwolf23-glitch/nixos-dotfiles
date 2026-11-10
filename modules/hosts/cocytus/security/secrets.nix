{
  pins.nix-secrets = {
    url = "https://github.com/unnamed-systems/nix-secrets";
    follows.nixpkgs = "nixpkgs";
  };

  flake.modules.nixos.cocytus-secrets = {
    inputs,
    config,
    user,
    ...
  }: {
    imports = [inputs.nix-secrets.nixosModules.default];

    security.nix-secrets = {
      enable = true;
      storage = ../../../../secrets/cocytus;
      identityPaths = ["/persist/secrets/age/keys.txt"];
      recipientAliases.cocytus = "age1pn9g5yf9k6406f2h4hwjc9asr579997yxvddurljk5zq8cvmjyzsw2l77q";

      secrets = {
        github_token = {
          recipients = ["cocytus"];
          owner = "${user}";
        };
        password_hash = {
          recipients = ["cocytus"];
          neededForUsers = true;
        };
        ssh_id_ed25519 = {
          recipients = ["cocytus"];
          owner = "${user}";
          path = "/home/${user}/.ssh/id_ed25519";
          mode = "0600";
        };
      };
    };
    nix.extraOptions = "!include ${config.security.nix-secrets.secrets.github_token.path}";
  };
}
