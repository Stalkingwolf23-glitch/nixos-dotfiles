{
  flake.modules.homeManager.zen = {
    programs.zen-browser.profiles."default".keyboardShortcuts = [
      {
        id = "zen-compact-mode-toggle";
        key = "c";
        modifiers = {
          control = true;
          alt = true;
        };
      }
      {
        id = "zen-toggle-sidebar";
        key = "x";
        modifiers = {
          control = true;
          alt = true;
        };
      }
      {
        id = "key_quitApplication";
        disabled = true;
      }
      {
        id = "zen-workspace-switch-1";
        key = "1";
        modifiers = {
          control = true;
        };
        disabled = false;
      }
      {
        id = "zen-workspace-switch-2";
        key = "2";
        modifiers = {
          control = true;
        };
        disabled = false;
      }
      {
        id = "zen-workspace-switch-3";
        key = "3";
        modifiers = {
          control = true;
        };
        disabled = false;
      }
      {
        id = "zen-workspace-switch-4";
        key = "4";
        modifiers = {
          control = true;
        };
        disabled = false;
      }
      {
        id = "zen-workspace-switch-5";
        key = "5";
        modifiers = {
          control = true;
        };
        disabled = false;
      }
      {
        id = "zen-workspace-forward";
        keycode = "VK_RIGHT";
        modifiers = {
          control = true;
        };
        disabled = false;
      }
      {
        id = "zen-workspace-backward";
        keycode = "VK_LEFT";
        modifiers = {
          control = true;
        };
        disabled = false;
      }
    ];
  };
}
