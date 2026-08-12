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

    # Monitor controls
    (bind "${mainMod} + TAB" ''hl.dsp.focus({ monitor = "+1" })'')
    (bind "${mainMod} + CTRL + TAB" ''hl.dsp.window.move({ monitor = "+1", follow = true })'')
  ];
}
