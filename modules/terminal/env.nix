{
  flake.modules.homeManager.terminal =
    { config, ... }:
    {
      home.sessionVariables = {
        EDITOR = "nvim";
        APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
        TACK_NIX_CONF_TOKENS = "1";
      };

      xdg.userDirs = {
        enable = true;
        desktop = config.home.homeDirectory;
      };
    };

  flake.modules.nixos.terminal = {
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      GTK_THEME = "adw-gtk3-dark";
      QT_STYLE_OVERRIDE = "breeze";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = "qt6ct";
    };
  };
}
