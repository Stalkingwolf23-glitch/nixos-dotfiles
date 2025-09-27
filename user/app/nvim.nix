{ inputs, system, pkgs, ... }:

{
  imports = [
    inputs.kickstart-nixvim.homeModules.default
  ]

  programs.nixvim.enable = true;
}