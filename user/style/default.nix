{
  pkgs,
  ...
}:

{
  stylix = {
    enable = true;
    autoEnable = true;
    opacity = {
      applications = 0.9;
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
      noctalia-shell.enable = false;
      vicinae.enable = false;
      hyprland.enable = false;

      gtk.extraCss = ''
        .dialog-action-area > .text-button {
          color: @dialog_fg_color;
        }
      '';
      qt.platform = "kvantum";
    };

    icons = {
      enable = true;
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    cursor = {
      name = "volantes_cursors";
      package = pkgs.volantes-cursors;
      size = 28;
    };

    fonts = {
      serif = {
        package = pkgs.maple-mono.NF-CN-unhinted;
        name = "Maple Mono NF CN";
      };
      sansSerif = {
        package = pkgs.maple-mono.NF-CN-unhinted;
        name = "Maple Mono NF CN";
      };
      monospace = {
        package = pkgs.maple-mono.NF-CN-unhinted;
        name = "Maple Mono NF CN";
      };
    };
  };

  fonts.fontconfig.enable = true;
}
