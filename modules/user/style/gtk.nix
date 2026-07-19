{ pkgs, ... }:

{
  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "Colloid-Dark-Compact-Catppuccin";
      package = pkgs.colloid-gtk-theme.override {
        themeVariants = [ "default" ];
        colorVariants = [ "dark" ];
        sizeVariants = [ "compact" ];
        tweaks = [ "catppuccin" ];
      };
    };

    gtk4 = {
      theme = {
        name = "Colloid-Dark-Compact-Catppuccin";
        package = pkgs.colloid-gtk-theme.override {
          themeVariants = [ "default" ];
          colorVariants = [ "dark" ];
          sizeVariants = [ "compact" ];
          tweaks = [ "catppuccin" ];
        };
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
    };
  };
}
