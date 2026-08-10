{ ... }:
{
  flake.modules.homeManager.hyprland-keybinds =
    { config, ... }:
    let
      mainMod = "SUPER";
      workspaceCount = config.hyprland.workspaceCount;
      hyprLua = config.hyprland.hyprLua;

      bind = key: dispatcher: {
        _args = [
          key
          (hyprLua dispatcher)
        ];
      };

      bindOpts = key: dispatcher: opts: {
        _args = [
          key
          (hyprLua dispatcher)
          (hyprLua opts)
        ];
      };
    in
    {
      wayland.windowManager.hyprland = {
        settings = {
          bind = [
            # Main apps
            (bind "${mainMod} + T" ''hl.dsp.exec_cmd("kitty")'') # Terminal
            (bind "${mainMod} + B" ''hl.dsp.exec_cmd("zen-beta")'') # Browser
            (bind "${mainMod} + D" ''hl.dsp.exec_cmd("discord")'') # Discord
            (bind "${mainMod} + N" ''hl.dsp.exec_cmd("dolphin")'') # File Manager

            # Panels
            (bind "${mainMod} + RETURN" ''hl.dsp.exec_cmd("noctalia msg panel-toggle control-center")'') # Noctalia control center
            (bind "${mainMod} + A" ''hl.dsp.exec_cmd("noctalia msg panel-toggle launcher")'') # Launcher
            (bind "${mainMod} + G" ''hl.dsp.exec_cmd("rofi -modi games:game-launcher.sh -show games -show-icons -theme games-smaller")'') # Game Launcher
            (bind "${mainMod} + V" ''hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard")'') # Clipboard
            (bind "${mainMod} + SHIFT + W" ''hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper")'')

            # System
            (bind "${mainMod} + SHIFT + L" ''hl.dsp.exec_cmd("noctalia msg session lock")'') # Lock screen
            (bind "${mainMod} + ESCAPE" ''hl.dsp.exec_cmd("noctalia msg panel-toggle session")'') # Session Menu
            (bind "${mainMod} + Print" ''hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen")'') # Screenshot current monitor
            (bind "Print" ''hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen all")'') # Screenshot all monitors
            (bind "${mainMod} + SHIFT + S" ''hl.dsp.exec_cmd("noctalia msg screenshot-region")'') # Screenshot region picker

            # Window Controls
            (bind "${mainMod} + SHIFT + Q" "hl.dsp.window.close()") # Quit Application
            (bind "${mainMod} + F" ''hl.dsp.window.fullscreen({ mode = "maximized", layout_aware = true })'') # Toggle maximized
            (bind "${mainMod} + M" ''hl.dsp.window.fullscreen({ mode = "fullscreen", layout_aware = true })'') # Toggle Maximized

            # Focus
            (bind "${mainMod} + LEFT" ''hl.dsp.layout("focus l")'')
            (bind "${mainMod} + RIGHT" ''hl.dsp.layout("focus r")'')

            # Vim-style focus
            (bind "${mainMod} + H" ''hl.dsp.layout("focus l")'')
            (bind "${mainMod} + L" ''hl.dsp.layout("focus r")'')

            # Move active window
            (bind "${mainMod} + CTRL + LEFT" ''hl.dsp.window.move({ direction = "l" })'')
            (bind "${mainMod} + CTRL + DOWN" ''hl.dsp.window.move({ direction = "d" })'')
            (bind "${mainMod} + CTRL + UP" ''hl.dsp.window.move({ direction = "u" })'')
            (bind "${mainMod} + CTRL + RIGHT" ''hl.dsp.window.move({ direction = "r" })'')

            # Vim-style window movement
            (bind "${mainMod} + CTRL + H" ''hl.dsp.window.move({ direction = "l" })'')
            (bind "${mainMod} + CTRL + J" ''hl.dsp.window.move({ direction = "d" })'')
            (bind "${mainMod} + CTRL + K" ''hl.dsp.window.move({ direction = "u" })'')
            (bind "${mainMod} + CTRL + L" ''hl.dsp.window.move({ direction = "r" })'')

            # Vertical resize
            (bindOpts "${mainMod} + MINUS" "hl.dsp.window.resize({ x = 0, y = -10, relative = true })"
              "{ repeating = true }"
            )
            (bindOpts "${mainMod} + EQUAL" "hl.dsp.window.resize({ x = 0, y = 10, relative = true })"
              "{ repeating = true }"
            )

            # Horizontal resize
            (bindOpts "${mainMod} + CTRL + MINUS" "hl.dsp.window.resize({ x = -10, y = 0, relative = true })"
              "{ repeating = true }"
            )
            (bindOpts "${mainMod} + CTRL + EQUAL" "hl.dsp.window.resize({ x = 10, y = 0, relative = true })"
              "{ repeating = true }"
            )

            # Mouse controls
            (bindOpts "${mainMod} + mouse:272" "hl.dsp.window.drag()" "{ mouse = true }") # Move focused window
            (bindOpts "${mainMod} + mouse:273" "hl.dsp.window.resize()" "{ mouse = true }") # Resize focused window
            (bind "${mainMod} + mouse_left" ''hl.dsp.layout("focus l")'')
            (bind "${mainMod} + mouse_right" ''hl.dsp.layout("focus r")'')

            # Monitor controls
            (bind "${mainMod} + TAB" ''hl.dsp.focus({ monitor = "+1" })'')
            (bind "${mainMod} + SHIFT + TAB" ''hl.dsp.window.move({ monitor = "+1", follow = true })'')
          ];
        };
        extraLuaFiles."hyprsplit/keybinds" = {
          autoLoad = true;
          content = ''
            local hs = require("hyprsplit")
            local mainMod = "SUPER"

            for i = 1, ${toString workspaceCount} do
              local key = i % 10

              hl.bind("SUPER + " .. key,hs.dsp.focus({ workspace = i }))
              hl.bind("SUPER + SHIFT + " .. key,hs.dsp.window.move({workspace = i,follow = false,}))
              hl.bind("SUPER + CTRL + " .. key,hs.dsp.window.move({workspace = i,follow = false,}))
            end

            -- Navigate workspaces on the current monitor
            hl.bind(mainMod .. " + up",           hs.dsp.focus({ workspace = "m+1" }))
            hl.bind(mainMod .. " + down",         hs.dsp.focus({ workspace = "m-1" }))
            hl.bind(mainMod .. " + J",             hs.dsp.focus({ workspace = "m+1" }))
            hl.bind(mainMod .. " + K",             hs.dsp.focus({ workspace = "m-1" }))
            hl.bind(mainMod .. " + SHIFT + G",    hs.dsp.grab_rogue_windows())
            -- Workspace scrolling with mousewheel within the monitor
            hl.bind(mainMod .. " + mouse_down", hs.dsp.focus({ workspace = "m+1" }))
            hl.bind(mainMod .. " + mouse_up", hs.dsp.focus({ workspace = "m-1" }))
          '';
        };
      };
    };
}
