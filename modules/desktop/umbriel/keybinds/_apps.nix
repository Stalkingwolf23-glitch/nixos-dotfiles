{
  programs.umbriel.settings.keybinds = {
    # Primary Programs
    "Mod+T" = "spawn:kitty"; # Terminal
    "Mod+E" = "spawn:dolphin";
    "Mod+Z" = "spawn:zeditor";
    "Mod+G" = "spawn:rofi -modi games:game-launcher.sh -show games -show-icons -theme games";

    # Noctalia Panels
    "Mod" = "spawn:noctalia msg panel-toggle launcher";
    "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
    "Mod+Shift+W" = "spawn:noctalia msg panel-toggle wallpaper";
    "Mod+Return" = "spawn:noctalia msg panel-toggle control-center";
    "Mod+Escape" = "spawn:noctalia msg panel-toggle session";
  };
}
