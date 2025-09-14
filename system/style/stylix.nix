{ config, stylix, pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    
    fonts = {
      serif = {
      package = (pkgs.callPackage ../wm/monolisa.nix { });
      name = "Monolisa";
      };
      sansSerif = {
        package = (pkgs.callPackage ../wm/monolisa.nix { });
        name = "Monolisa";
      };
      sizes = {
        applications = 14;
        terminal = 13;
      };
    };
  };
}