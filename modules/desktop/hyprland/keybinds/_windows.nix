{ config, ... }:
let
  hyprLua = config.hyprland.hyprLua;
  mainMod = config.hyprland.mainMod;
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
  wayland.windowManager.hyprland.settings.bind = [
    # System
    (bind "${mainMod} + SHIFT + L" ''hl.dsp.exec_cmd("noctalia msg session lock")'') # Lock screen
    (bind "${mainMod} + ESCAPE" ''hl.dsp.exec_cmd("noctalia msg panel-toggle session")'') # Session Menu
    (bind "${mainMod} + Print" ''hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen")'') # Screenshot current monitor
    (bind "Print" ''hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen all")'') # Screenshot all monitors
    (bind "${mainMod} + SHIFT + S" ''hl.dsp.exec_cmd("noctalia msg screenshot-region")'') # Screenshot region picker
    (bind "${mainMod} + SHIFT + R" ''hl.dsp.exec_cmd("noctalia msg plugin noctalia/screen_recorder:service all toggle focused")'') # Screen Recorder

    # Window Controls
    (bind "${mainMod} + CTRL + Q" "hl.dsp.window.close()") # Quit Application
    (bind "${mainMod} + F" ''hl.dsp.window.fullscreen({ mode = "maximized", layout_aware = true })'') # Toggle maximized
    (bind "${mainMod} + M" ''hl.dsp.window.fullscreen({ mode = "fullscreen", layout_aware = true })'') # Toggle Maximized

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

  ];
}
