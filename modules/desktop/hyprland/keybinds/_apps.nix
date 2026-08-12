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

    # Audio
    (bindOpts "XF86AudioNext" ''hl.dsp.exec_cmd("playerctl next")'' "{ locked = true }")
    (bindOpts "XF86AudioPause" ''hl.dsp.exec_cmd("playerctl play-pause")'' "{ locked = true }")
    (bindOpts "XF86AudioPlay" ''hl.dsp.exec_cmd("playerctl play-pause")'' "{ locked = true }")
    (bindOpts "XF86AudioPrev" ''hl.dsp.exec_cmd("playerctl previous")'' "{ locked = true }")

    (bindOpts "XF86AudioRaiseVolume"
      ''hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ ")''
      "{ locked = true, repeating = true }"
    )
    (bindOpts "XF86AudioLowerVolume" ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")''
      "{ locked = true, repeating = true }"
    )
    (bindOpts "XF86AudioMute" ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")''
      "{ locked = true }"
    )
    (bindOpts "XF86AudioMicMute" ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")''
      "{ locked = true }"
    )
    (bindOpts "XF86AudioRaiseVolume"
      ''hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")''
      "{ locked = true, repeating = true }"
    )
  ];
}
