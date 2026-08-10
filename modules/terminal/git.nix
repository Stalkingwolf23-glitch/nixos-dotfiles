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
            email = "stalkingwolf23@proton.me";
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
