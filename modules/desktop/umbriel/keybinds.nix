{
  flake.modules.homeManager.umbriel-keybinds = {
    imports = [
      ./keybinds/_apps.nix
      ./keybinds/_system.nix
      ./keybinds/_windows.nix
      ./keybinds/_workspaces.nix
    ];

    programs.umbriel.settings = {
      input = {
        middle_click_paste = false;
        mouse.accel_profile = "flat";
        cursor = {
          size = 32;
          hide_when_typing = true;
          # follows_focus = true;
          hide_timeout_ms = 6000;
        };
        focus.follows_mouse = true;
      };
    };
  };
}
