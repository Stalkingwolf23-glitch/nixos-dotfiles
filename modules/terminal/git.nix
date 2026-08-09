{
  ...
}:

{
  flake.modules.homeManager.terminal =
    { config, pkgs, ... }:
    {
      home.packages = [ pkgs.git ];
      programs.git = {
        enable = true;
        settings = {
          user = {
            name = "Stalkingwolf";
            email = "stalkingwolf@cocytus.me";
          };
          init.defaultBranch = "main";
          safe.directory = [
            "${config.home.homeDirectory}/local/nixos"
            "${config.home.homeDirectory}/local/nixos/.git"
          ];
        };
      };
    };
}
