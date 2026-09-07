{
  flake.modules.homeManager.zed = {
    programs.zed-editor = {
      enable = true;
      themes = "Theme";
      mutableUserSettings = false;
      mutableUserKeymaps = false;
      mutableUserTasks = false;
      defaultEditor = true;
      extensions = [
        "catppuccin-blur"
        "catppuccin-icons"
      ];

      userSettings = {
        autosave = "off";
        auto_update = false;
        telemetry = {
          diagnostics = false;
          metrics = false;
          anthropic_retention = false;
        };
        base_keymap = "VSCode";
        vim_mode = true;
        vim.toggle_relative_line_numbers = true;
        which_key.enabled = true;
        indent_guides = {
          background_coloring = "off";
          coloring = "indent_aware";
        };
        diagnostics.inline.enabled = true;
        session.trust_all_worktrees = true;
        project_panel.dock = "left";
        outline_panel.dock = "left";
      };
    };
  };
}
