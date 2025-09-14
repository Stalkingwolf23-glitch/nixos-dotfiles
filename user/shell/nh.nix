{ pkgs, userSettings, ... }:

{
  programs.nh = {
    enable = true;
    package = pkgs.nh;
    clean.enable = true;
    flake = "/home/${userSettings.username}/nixos";
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
