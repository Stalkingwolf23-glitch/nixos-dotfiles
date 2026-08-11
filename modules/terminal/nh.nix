{ self, ... }:

{
  flake.modules.homeManager.nh =
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

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.nh
  ];
}
