{
  flake.modules.homeManager.umbriel-autostart = {
    programs.umbriel.settings.general.autostart = [
      "noctalia"
      "steam -silent"
      "equibop"
      "zen-beta"
    ];
  };
}
