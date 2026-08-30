{ self, ... }:

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
        addToSystemPackages = false;
        extraPackages = [ pkgs.python313Packages.ddgs ];
        extraPlugins = [ ponytailPlugin ];
      };

      environment.systemPackages = [
        (pkgs.writeShellApplication {
          name = "hermes-tui";
          runtimeInputs = [ pkgs.systemd ];
          text = ''
            set -eu
            exec systemd-run \
              --user \
              --scope \
              --quiet \
              --setenv=HERMES_HOME=/home/stalkingwolf/hermes/.hermes \
              --working-directory=/home/stalkingwolf/hermes/workspace \
              --property=ProtectHome=read-only \
              --property=ReadWritePaths=/home/stalkingwolf/hermes \
              --property=ReadWritePaths=/home/stalkingwolf/git \
              ${lib.getExe config.services.hermes-agent.package} "$@"
          '';
        })
      ];
      environment.shellAliases.hermes = "hermes-tui";
    };
}
