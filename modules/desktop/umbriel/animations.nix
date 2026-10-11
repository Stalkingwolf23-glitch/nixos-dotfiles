{
  flake.modules.homeManager.umbriel-animations = {
    programs.umbriel.settings.animation = {
      duration_ms = 250;
      curve = "easeout";

      windows_in = {
        enabled = true;
        duration_ms = 200;
        curve = "easeout";
        style = "popin";
        scale = 0.85;
      };

      windows_out = {
        enabled = true;
        duration_ms = 200;
        curve = "easeout";
        style = "fade";
      };

      workspaces = {
        enabled = true;
        duration_ms = 250;
        curve = "easeout";
      };

      overview = {
        enabled = true;
        duration_ms = 250;
        curve = "easeout";
      };
    };
  };
}
