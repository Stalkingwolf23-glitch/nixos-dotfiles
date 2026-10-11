{
  programs.umbriel.settings.keybinds = {
    # Media Control
    "XF86AudioRaiseVolume" = {
      action = "spawn:noctalia msg volume-up";
      allow_when_locked = true;
    };
    "XF86AudioLowerVolume" = {
      action = "spawn:noctalia msg volume-down";
      allow_when_locked = true;
    };
    "XF86AudioMute" = {
      action = "spawn:noctalia msg volume-mute";
      allow_when_locked = true;
    };
    "XF86AudioMicMute" = {
      action = "spawn:noctalia msg mic-mute";
      allow_when_locked = true;
    };
    "XF86AudioNext" = {
      action = "spawn:noctalia msg media next";
      allow_when_locked = true;
    };
    "XF86AudioPrev" = {
      action = "spawn:noctalia msg media previous";
      allow_when_locked = true;
    };
    "XF86AudioPlay" = {
      action = "spawn:noctalia msg media toggle";
      allow_when_locked = true;
    };
    "XF86AudioPause" = {
      action = "spawn:noctalia msg media stop";
      allow_when_locked = true;
    };

    # Brightness
    "XF86MonBrightnessUp" = {
      action = "spawn:noctalia msg brightness-up";
      allow_when_locked = true;
    };
    "XF86MonBrightnessDown" = {
      action = "spawn:noctalia msg brightness-down";
      allow_when_locked = true;
    };

    # Power
    "Mod+Shift+P" = "dpms-off";

    # Lock
    "Mod+Shift+L" = "spawn:noctalia msg session lock";
  };
}
