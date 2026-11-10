{self, ...}: {
  flake.modules.homeManager.equibop = {
    imports = [
      ./_plugins.nix
      ./themes/_default.nix
    ];

    programs.equibop = {
      enable = true;
      equicord.settings = {
        "autoUpdate" = false;
        "autoUpdateNotification" = false;
        "cloud" = {
          "authenticated" = false;
          "settingsSync" = false;
          "settingsSyncVersion" = 1789207228404;
          "url" = "https://cloud.equicord.org/";
        };
        "disableMinSize" = false;
        "eagerPatches" = false;
        "enableReactDevtools" = false;
        "frameless" = true;
        "ignoreResetWarning" = false;
        "mainWindowFrameless" = false;
        "notifications" = {
          "logLimit" = 50;
          "missed" = true;
          "position" = "bottom-right";
          "timeout" = 5000;
          "useNative" = "not-focused";
        };
        "notifyAboutUpdates" = false;
        "pinnedThemes" = [];
        "themeActivationModes" = {};
        "themeLinks" = [];
        "themeNames" = {};
        "themes" = {};
        "transparent" = true;
        "uiElements" = {
          "chatBarButtons" = {};
          "messagePopoverButtons" = {};
        };
        "winCtrlQ" = false;
        "winNativeTitleBar" = false;
        "windowsMaterial" = "none";
      };
    };
  };

  flake.modules.homeManager.applications.imports = [
    self.modules.homeManager.equibop
  ];

  flake.modules.nixos.equibop-preservation = {user, ...}: {
    preservation.preserveAt."/persist".users.${user} = {
      directories = [".config/equibop"];
    };
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.equibop-preservation];
}
