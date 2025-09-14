{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      on-button-left = "dismiss";
      on-button-middle = "none";
      on-button-right = "dismiss-all";

      padding = 10;
      border-size = 2;
      margin = 10;
      height = 200;
      border-radius = 8;
      max-icon-size = 52;

      background-color = "#${config.lib.stylix.colors.base00}";
      text-color = "#${config.lib.stylix.colors.base05}";
      border-color = "#${config.lib.stylix.colors.base0D}";
      progress-color = "over #${config.lib.stylix.colors.base04}";

      default-timeout = 50000;
    };
    extraConfig = ''
      [urgency=low]
      default-timeout=4000

      [urgency=normal]
      default-timeout=6000

      [urgency=critical]
      default-timeout=0
      border-color=#${config.lib.stylix.colors.base08}

      [mode=dnd]
      ignore-timeout=1
      default-timeout=0
      invisible=1
    '';
  };
}