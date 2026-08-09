{
  flake.modules.homeManager.terminal =
    { config, pkgs, ... }:
    {
      programs.nh = {
        enable = true;
        package = pkgs.nh;
        clean.enable = true;
        flake = "${config.home.homeDirectory}/local/nixos";
        clean.extraArgs = "--keep 5 --optimise";
      };
    };
}
