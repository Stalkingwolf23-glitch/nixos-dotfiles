{
  pkgs,
  ...
}:

{
  stylix = {
    enable = true;
    autoEnable = false;
    opacity = {
      applications = 0.8;
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      yazi.enable = true;
      gtk.enable = true;
      kitty.enable = true;
      qt.enable = true;
      kde.enable = true;
      hyprland.enable = true;

      gtk.extraCss = ''
        .dialog-action-area > .text-button {
          color: @dialog_fg_color;
        }
      '';
      qt.platform = "qtct";
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
      name = "catppuccin-mocha-dark-cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 28;
    };

    fonts = {
      serif = {
        package = pkgs.moralerspace;
        name = "Moralerspace Argon";
      };
      sansSerif = {
        package = pkgs.moralerspace;
        name = "Moralerspace Argon";
      };
      monospace = {
        package = pkgs.moralerspace;
        name = "Moralerspace Argon";
      };
    };
  };
}
