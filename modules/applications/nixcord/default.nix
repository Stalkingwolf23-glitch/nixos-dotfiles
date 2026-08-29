{ self, ... }:

{
  flake-file.inputs.nixcord = {
    url = "github:4evy/nixcord";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.flake-parts.follows = "flake-parts";
  };

  flake.modules.homeManager.nixcord =
    { inputs, ... }:
    {
      imports = [ inputs.nixcord.homeModules.nixcord ];
      nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };

      programs.nixcord = {
        enable = true;
        discord.equicord.enable = true;
        discord.krisp.enable = true;
        config = {
          frameless = true;
          transparent = true;
        };
      };
    };

  flake.modules.homeManager.applications.imports = [
    self.modules.homeManager.nixcord
  ];

  flake.modules.nixos.nixcord-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [ ".config/discord" ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.nixcord-preservation ];
}
