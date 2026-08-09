{ inputs, ... }:

{
  flake-file.inputs.nixcord.url = "github:4evy/nixcord";

  flake.modules.homeManager.nixcord = { inputs, ... }:
    {
      imports = [ inputs.nixcord.homeModules.nixcord ];

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
}
