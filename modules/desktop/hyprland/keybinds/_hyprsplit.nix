{ config, ... }:
let
  mainMod = config.hyprland.mainMod;
  workspaceCount = config.hyprland.workspaceCount;
in
{
  wayland.windowManager.hyprland.extraLuaFiles."hyprsplit/keybinds" = {
    autoLoad = true;
    content = ''
      local hs = require("hyprsplit")
      local mainMod = "${mainMod}"

      for i = 1, ${toString workspaceCount} do
        local key = i % 10

        hl.bind(mainMod .. " + " .. key,hs.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + CTRL + " .. key,hs.dsp.window.move({workspace = i,follow = false,}))
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
}
