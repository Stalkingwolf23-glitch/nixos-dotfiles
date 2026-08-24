{ self, ... }:

{
  flake-file.inputs.hermes = {
    url = "github:NousResearch/hermes-agent";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake-file.inputs.ponytail = {
    url = "github:DietrichGebert/ponytail";
    flake = false;
  };

  flake.modules.nixos.hermes =
    { inputs, pkgs, ... }:
    let
      ponytailPlugin = pkgs.runCommand "hermes-ponytail" { } ''
        mkdir -p "$out"
        cp -R ${inputs.ponytail}/. "$out/"
      '';
    in
    {
      imports = [ inputs.hermes.nixosModules.default ];

      services.hermes-agent = {
        enable = true;
        stateDir = "/var/lib/hermes";
        workingDirectory = "/var/lib/hermes/workspace";
        addToSystemPackages = true;
        extraPackages = [ pkgs.python313Packages.ddgs ];
        extraPlugins = [ ponytailPlugin ];
      };
    };

  flake.modules.nixos.hermes-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [ "/var/lib/hermes" ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.hermes-preservation ];
}
