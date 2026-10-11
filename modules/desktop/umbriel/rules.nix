{
  flake.modules.homeManager.umbriel-rules = {
    programs.umbriel.settings = {
      window_rule = [
        {
          blur = true;
        }
        {
          match.is_alone = true;
          default_maximize = true;
        }
        {
          match.app_id = "^steam$";
          match.title = "^notificationtoasts_\\d+_desktop$";
          default_floating = true;
          default_position = {
            x = 10;
            y = 10;
            anchor = "bottom_right";
          };
          default_focused = false;
        }
        {
          match.app_id = "^(dev\\.noctalia\\.UmbrielSharePicker)$";
          default_floating = true;
          default_floating_size_px = {
            width = 800;
            height = 600;
          };
        }
        {
          match.app_id = "^kitty$";
          match.title = "^termfilechooser$";
          default_floating = true;
          default_floating_size_px = {
            width = 800;
            height = 600;
          };
        }
        {
          match.app_id = "^(rofi|moe\\.launcher\\.the-honkers-railway-launcher)$";
          default_floating = true;
          default_position = {
            x = 0;
            y = 0;
            anchor = "center";
          };
        }
        {
          match.app_id = "^(steam_app_[0-9]+|gamescope)$";
          default_fullscreen = true;
          default_workspace = "1";
          default_output = "DP-1";
        }
      ];

      layer_rule = [
        {
          match.namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^\"]*)$";
          blur = true;
          blur_ignore_alpha = 0.5;
          blur_popups = true;
        }
      ];
    };
  };
}
