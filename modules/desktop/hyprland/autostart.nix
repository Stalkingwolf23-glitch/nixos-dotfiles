{...}: {
  flake.modules.homeManager.hyprland-autostart = {config, ...}: let
    hyprLua = config.hyprland.hyprLua;
  in {
    wayland.windowManager.hyprland.settings.on = [
      {
        _args = [
          "hyprland.start"
          (hyprLua ''
            function()
              hl.dispatch(hl.dsp.exec_cmd("noctalia"))
              hl.dispatch(hl.dsp.exec_cmd("steam -silent"))
            end
          '')
        ];
      }
    ];
  };
}
