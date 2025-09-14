{ config, pkgs, lib, ... }:

{
  programs.vesktop = {
    enable = true;

    settings = {
      appBadge = true;
      arRPC = true;
      customTitleBar = false;
      hardwareAcceleration = true;
      discordBranch = "stable";
      minimizeToTray = true;
      tray = true;
      splashTheming = true;
      splashColor = "rgb(186, 194, 222)";
      splashBackground = "rgb(30, 30, 46)";
    };

    vencord = {
      themes = {
        "midnight-catppuccin-mocha" = ../../../assets/vesktop/themes/midnight-catppuccin-mocha.theme.css;
        "server-columns" = ../../../assets/vesktop/themes/ServerColumns.theme.css;
      };

      settings = {
        enabledThemes = [
          "midnight-catppuccin-mocha.css"
          "server-columns.css"
        ];
        useQuickCss = true;
      };
    };
  };
}
