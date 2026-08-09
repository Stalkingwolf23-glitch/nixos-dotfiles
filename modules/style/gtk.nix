{
  flake.modules.homeManager.style = { pkgs, ... }:
    {
    gtk = {
      enable = true;
      colorScheme = "dark";
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };

      gtk4 = {
        theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };
        extraCss = ''@import url("noctalia.css");'';
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
          flavor = "mocha";
          accent = "blue";
        };
      };
    };
    };
}
