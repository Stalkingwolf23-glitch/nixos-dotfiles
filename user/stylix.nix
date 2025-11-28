{
  pkgs,
  ...
}:

{
  stylix = {
    enable = true;
    autoEnable = true;
    opacity = {
      applications = 0.8;
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      zen-browser.enable = false;
      mangohud.enable = false;
      vencord.enable = false;
      btop.enable = false;
      nixvim.enable = false;
      neovim.enable = false;

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
        package = pkgs.nerd-fonts.monaspace;
        name = "MonaspiceNe Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.monaspace;
        name = "MonaspiceAr Nerd Font";
      };
      monospace = {
        package = pkgs.nerd-fonts.monaspace;
        name = "MonaspiceKr Nerd Font";
      };
    };
  };
}
