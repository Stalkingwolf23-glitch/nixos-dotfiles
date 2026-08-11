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

in
{
  wayland.windowManager.hyprland.settings.bind = [
    # Main apps
    (bind "${mainMod} + T" ''hl.dsp.exec_cmd("kitty")'') # Terminal
    (bind "${mainMod} + B" ''hl.dsp.exec_cmd("zen-beta")'') # Browser
    (bind "${mainMod} + D" ''hl.dsp.exec_cmd("discord")'') # Discord
    (bind "${mainMod} + N" ''hl.dsp.exec_cmd("dolphin")'') # File Manager

    # Panels
    (bind "${mainMod} + RETURN" ''hl.dsp.exec_cmd("noctalia msg panel-toggle control-center")'') # Noctalia control center
    (bind "${mainMod} + A" ''hl.dsp.exec_cmd("noctalia msg panel-toggle launcher")'') # Launcher
    (bind "${mainMod} + G" ''hl.dsp.exec_cmd("rofi -modi games:game-launcher.sh -show games -show-icons -theme games")'') # Game Launcher
    (bind "${mainMod} + V" ''hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard")'') # Clipboard
    (bind "${mainMod} + SHIFT + W" ''hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper")'')
  ];
}
