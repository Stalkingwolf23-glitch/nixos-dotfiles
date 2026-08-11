{
  flake.modules.homeManager.hyprland-rules = {
    wayland.windowManager.hyprland.settings.window_rule =
      let
        mkRule = rule: {
          _args = [ rule ];
        };
      in
      map mkRule [
        {
          match.class = "^[Xx]dg-desktop-portal-gtk$";
          float = true;
          center = true;
          size = [
            "monitor_w * 0.5"
            "monitor_h * 0.7"
          ];
          opacity = "1.0 override";
          no_shadow = true;
          no_blur = true;
        }
        {
          match.title = "^File Operation Progress$";
          float = true;
          center = true;
        }
        {
          match.title = "^Open File$";
          float = true;
          center = true;
        }
        {
          match.title = "^Open Folder$";
          float = true;
          center = true;
        }
        {
          match.title = "^(Confirm File Replacing|Copying files|Moving files)$";
          float = true;
          move = [
            "monitor_w * 0.18"
            "monitor_h * 0.35"
          ];
        }
        {
          match.title = "^Dolphin$";
          no_screen_share = true;
          xray = false;
        }
        {
          match.class = "^kitty$";
          xray = false;
        }
        {
          match.class = "^(rofi|moe\\.launcher\\.the-honkers-railway-launcher)$";
          float = true;
          center = true;
        }
        {
          match.content = "game";
          idle_inhibit = "fullscreen";
        }
        {
          match.class = "^(steam_app_[0-9]+|gamescope)$";
          idle_inhibit = "fullscreen";
          fullscreen = true;
          workspace = "1 silent";
        }
      ];
  };
}
