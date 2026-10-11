{
  flake.modules.homeManager.umbriel-output = {
    programs.umbriel.settings.output = {
      "DP-1" = {
        mode = "2560x1440@180.00";
        scale = 1;
        position = [0 0];
        focus_at_startup = true;
        hdr = "on";
        sdr_white = 320;
      };

      "HDMI-A-2" = {
        mode = "2560x1440@144.00";
        scale = 1;
        position = [2560 0];
      };
    };
  };
}
