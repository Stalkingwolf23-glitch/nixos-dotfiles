{ config, pkgs, lib, ... }:

let
  waybar-old = pkgs.waybar.overrideAttrs (old: {
    version = "0.13.0";
    src = pkgs.fetchFromGitHub {
      owner = "Alexays";
      repo = "Waybar";
      rev = "0fcda9afa519eb84deda68c051f7938a6c6bdbce";
      hash = "sha256-KfWjYDqJf2jNmYAnmV7EQHweMObEBreUc2G7/LpvvC0=";
    };
  });
in
{
 programs.waybar = {
  enable = true;
  package = waybar-old;
 };
}