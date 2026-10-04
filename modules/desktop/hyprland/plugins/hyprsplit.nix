{inputs, ...}: {
  pins.hyprsplit = {
    url = "https://github.com/shezdy/hyprsplit";
    follows.nixpkgs = "nixpkgs";
  };

  flake.modules.homeManager.hyprland-hyprsplit = {config, ...}: let
    workspaceCount = config.hyprland.workspaceCount;
  in {
    wayland.windowManager.hyprland.extraLuaFiles = {
      "hyprsplit/init" = {
        autoLoad = false;
        content = builtins.readFile "${inputs.hyprsplit}/init.lua";
      };

      "hyprsplit/config" = {
        autoLoad = true;
        content = ''
          local hs = require("hyprsplit")

          hs.config({
            num_workspaces = ${toString workspaceCount},
            persistent_workspaces = true,
          })

          hs.monitor_priority({ "DP-1", "HDMI-A-2" })
        '';
      };
    };
  };
}
