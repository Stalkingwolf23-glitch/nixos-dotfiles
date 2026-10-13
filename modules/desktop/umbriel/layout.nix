{
  flake.modules.homeManager.umbriel-layout = {
    programs.umbriel.settings = {
      include.optional.files = ["noctalia.toml"];
      colors = {
        background = "#1e1e2e";
        text_primary = "#cdd6f4";
        text_muted = "#a6adc8";
        accent_primary = "#89b4fa";
        accent_secondary = "#cba6f7";
        warning = "#f9e2af";
        error = "#f38ba8";
      };

      colors.border = {
        focused = "#89b4fa";
        unfocused = "#24273a";
      };

      colors.overview = {
        background_tint = "#18182530";
      };

      appearance = {
        prefer_no_csd = true;
        border_width = 2;
        corner_radius = 10;

        blur = {
          optimized = false;
          radius = 4;
          noise = 0.0;
          contrast = 1;
          saturation = 1.0;
        };
      };

      layout = {
        mode = "scrolling";
        gap = 5;
        extent_presets = [0.333 0.5 0.667];

        scrolling = {
          default_extent_fraction = 0.5;
          center_underfull_strip = true;
          center_focused = "on_overflow";
        };
      };

      workspace = [
        {
          name = "Main";
          output = "DP-1";
        }
        {
          name = "Browser";
          output = "HDMI-A-2";
        }
        {
          name = "Chat";
          output = "HDMI-A-2";
        }
      ];
    };
  };
}
