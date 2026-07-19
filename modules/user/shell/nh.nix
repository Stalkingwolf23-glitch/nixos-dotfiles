{ pkgs, userSettings, ... }:

{
  programs.nh = {
    enable = true;
    package = pkgs.nh;
    clean.enable = true;
    flake = "/home/${userSettings.username}/local/nixos";
    clean.extraArgs = "--keep 5 --optimise";
  };
}
