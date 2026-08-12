{ self, ... }:

{
  flake.modules.homeManager.style =
    { ... }:
    {
      home.sessionVariables = {
        GTK_THEME = "adw-gtk3-dark";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
      };
    };

  flake.modules.homeManager.desktop.imports = [
    self.modules.homeManager.style
  ];
}
