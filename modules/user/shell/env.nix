{ userSettings, pkgs, ... }:

{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    EDITOR = "nvim";
    APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
    # QT
    QT_STYLE_OVERRIDE = "kvantum";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_PLUGIN_PATH = "${pkgs.kdePackages.qt6ct}/lib/qt-6/plugins";
  };

  xdg.userDirs = {
    enable = true;
    desktop = "/home/" + userSettings.username;
  };
}
