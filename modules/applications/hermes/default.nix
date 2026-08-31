{
  flake-file.inputs.hermes = {
    url = "github:NousResearch/hermes-agent";
  };

  flake-file.inputs.ponytail = {
    url = "github:DietrichGebert/ponytail";
    flake = false;
  };

  flake.modules.nixos.hermes =
    {
      config,
      inputs,
      pkgs,
      lib,
      ...
    }:
    let
      ponytailPlugin = pkgs.runCommand "hermes-ponytail" { } ''
        mkdir -p "$out"
        cp -R ${inputs.ponytail}/. "$out/"
      '';
    in
    {
      nix.settings.extra-substituters = [ "https://hermes-agent.cachix.org" ];
      nix.settings.extra-trusted-public-keys = [
        "hermes-agent.cachix.org-1:jN3pjR50Mxi4SESKC/FIMNM6/LCosvPk2VUwzVvebzU="
      ];

      imports = [ inputs.hermes.nixosModules.default ];

      services.hermes-agent = {
        enable = true;
        user = "stalkingwolf";
        group = "users";
        createUser = false;
        stateDir = "/home/stalkingwolf/hermes";
        workingDirectory = "/home/stalkingwolf/hermes/workspace";
        addToSystemPackages = true;
        extraPackages = [ pkgs.python313Packages.ddgs ];
        extraPlugins = [ ponytailPlugin ];
      };
    };
}
