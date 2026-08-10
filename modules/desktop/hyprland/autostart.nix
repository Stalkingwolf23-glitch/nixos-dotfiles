{ ... }:
{
  flake.modules.homeManager.hyprland-autostart =
    { config, ... }:
    let
      hyprLua = config.hyprland.hyprLua;
    in
    {
    wayland.windowManager.hyprland.settings.on = [
      {
        _args = [
          "hyprland.start"
          (hyprLua ''
            function()
              hl.dispatch(hl.dsp.exec_cmd("noctalia"))
              hl.dispatch(hl.dsp.exec_cmd("steam -silent"))
              hl.dispatch(hl.dsp.exec_cmd("wl-paste --type text --watch cliphist store"))
              hl.dispatch(hl.dsp.exec_cmd("wl-paste --type image --watch cliphist store"))
            end
          '')
        ];
      }
    ];
    };
}
