{ inputs, ... }:

{
  imports = [
    inputs.kickstart-nixvim.homeManagerModules.default
  ];

  programs.nixvim.enable = true;
}
