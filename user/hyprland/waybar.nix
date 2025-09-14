{ pkgs, lib, systemSettings, userSettings, ... }:

{
 programs.waybar = {
  enable = true;
  package = pkgs.waybar;
 };
}