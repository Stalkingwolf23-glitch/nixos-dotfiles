{
  flake.modules.homeManager.hyprland-layouts = {
    wayland.windowManager.hyprland.settings.config = [
      {
        _args = [
          {
            general = {
              layout = "scrolling";
              gaps_in = 10;
              gaps_out = 10;
              border_size = 1;
              col.active_border = "rgba(89b4faff)";
              col.inactive_border = "rgba(363b54ff)";
            };

            scrolling = {
              column_width = 0.5;
              focus_fit_method = 0;
              follow_min_visible = 0.4;
              wrap_focus = true;
              wrap_swapcol = true;
              direction = "right";
            };
          }
        ];
      }
    ];
  };
}
