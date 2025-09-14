{ config, stylix, pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      waybar.enable = false;
      zen-browser.enable = false;
      mako.enable = false;
      btop.enable = false;
      vesktop.enable = false;
    };

    iconTheme = {
      enable = true;
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
    
    cursor = {
      name = "Catppuccin Cursors - Mocha Dark";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 28;
    };

    fonts = {
      serif = {
      package = (pkgs.callPackage ../../system/wm/monolisa.nix { });
      name = "Monolisa";
      };
      sansSerif = {
        package = (pkgs.callPackage ../../system/wm/monolisa.nix { });
        name = "Monolisa";
      };
      monospace = {
        package = (pkgs.callPackage ../../system/wm/monolisa.nix { });
        name = "Monolisa";
      };
    };
  };
}