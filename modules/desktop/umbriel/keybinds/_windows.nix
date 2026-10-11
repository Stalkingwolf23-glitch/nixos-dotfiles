{
  programs.umbriel.settings.keybinds = {
    "Mod+Ctrl+Q" = "window-close"; # Close window

    "Mod+Minus" = "window-modify-primary-extent:-0.1";
    "Mod+Equal" = "window-modify-primary-extent:0.1";
    "Mod+Shift+Minus" = "window-modify-secondary-extent:-0.1";
    "Mod+Shift+Equal" = "window-modify-secondary-extent:0.1";

    "Mod+X" = "window-toggle-floating";
    "Mod+F" = "window-toggle-maximize";
    "Mod+M" = "window-toggle-maximize-to-edges";
    "Mod+Shift+F" = "window-toggle-fullscreen";
    "Mod+Tab" = "output-focus-next";

    "Mod+Print" = "spawn:noctalia msg screenshot-fullscreen DP-1";
    "Print" = "spawn:noctalia msg screenshot-fullscreen all";
    "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
    "Mod+Ctrl+Print" = "spawn:noctalia msg screenshot-annotate";
    "Mod+Shift+R" = "spawn:noctalia msg plugin noctalia/screen_recorder:service all toggle focused";

    "Mod+Slash" = "spawn:umbriel msg cheatsheet-toggle";
    "Mod+O" = {
      action = "overview-toggle";
      repeat = false;
    };
  };
}
