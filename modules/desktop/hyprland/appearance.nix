{
  flake.modules.homeManager.hyprland-appearance = {
    wayland.windowManager.hyprland.settings.config = [
      {
        _args = [
          {
            decoration = {
              rounding = 20;

              shadow = {
                enabled = true;
                range = 4;
                render_power = 3;
                offset = [
                  0
                  0
                ];
                color = "rgba(111111cc)";
                color_inactive = "rgba(111111cc)";
              };

              blur = {
                enabled = true;
                size = 12;
                passes = 3;
                noise = 0;
                brightness = 0.9;
                contrast = 1.25;
                vibrancy = 0.5;
                xray = false;
                new_optimizations = true;
                popups = true;
                popups_ignorealpha = 0.1;
                special = false;
              };
            };
          }
        ];
      }
    ];
  };
}
