{
  flake-file.inputs.nix-secrets = {
    url = "github:unnamed-systems/nix-secrets";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.naraka-secrets = { inputs, ... }: {
    imports = [ inputs.nix-secrets.nixosModules.default ];

    security.nix-secrets = {
      enable = true;
      storage = ../../../secrets/naraka;
      identityPaths = [ "/var/lib/nix-secrets/age-key.txt" ];
      recipientAliases.naraka = "age1dsgdqfy2wcunxxfa54j4qmrg59ewt5uvyqdhn4zjgayhngha4uhqyehw22";

      secrets = {
        "nitter-sessions.jsonl".recipients = [ "naraka" ];
      };
    };
  };
}
