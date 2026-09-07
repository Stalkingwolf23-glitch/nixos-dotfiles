{
  flake.modules.homeManager.zed = {
    programs.zed-editor = {
      enable = true;
      mutableUserSettings = true;
      mutableUserKeymaps = false;
      mutableUserTasks = false;
      defaultEditor = true;
      extensions = [
        "catppuccin"
        "catppuccin-blur"
        "catppuccin-icons"
      ];
    };
  };
}