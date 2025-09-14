{ inputs, pkgs, ... }:

{
  programs.hyprpanel = {
    package = inputs.hyprpanel.packages.${pkgs.system}.default;
    enable = true;
    
  };
}