{
  flake.modules.homeManager.hyprland-monitors = {
    wayland.windowManager.hyprland.settings = {
      monitor = [
        {
          _args = [
            {
              # Main monitor
              output = "DP-1";
              mode = "2560x1440@180.00";
              position = "0x0";
              scale = "auto";
            }
          ];
        }
        {
          _args = [
            {
              output = "HDMI-A-2";
              mode = "2560x1440@144.00";
              position = "2560x0";
              scale = "auto";
            }
          ];
        }
      ];
    };
  };
}
