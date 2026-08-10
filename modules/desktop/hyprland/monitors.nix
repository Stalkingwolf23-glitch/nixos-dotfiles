{
  flake.modules.homeManager.hyprland-monitors = {
      wayland.windowManager.hyprland.settings = {
        monitor = [
          {
            _args = [
              {
                # Main monitor
                output = "DP-1";
                mode = "preferred";
                position = "0x0";
                scale = "auto";
              }
            ];
          }
          {
            _args = [
              {
                output = "HDMI-A-2";
                mode = "preferred";
                position = "2560x0";
                scale = "auto";
              }
            ];
          }
        ];
      };
  };
}
