{ self, ... }:

{
  flake.modules.homeManager.initlua = {
    programs.yazi.initLua = ''
      local catppuccin_theme = require("yatline-catppuccin"):setup("mocha")
      require("full-border"):setup()
      require("yatline"):setup({
        theme = catppuccin_theme,
        show_background = true,

        header_line = {
          left = {
            section_a = {
              {type = "line", custom = false, name = "tabs", params = {"left"}},
            },
            section_b = {
            },
            section_c = {
            },
          },
          right = {
            section_a = {
              { type = "coloreds", custom = true, name = {{" 󰇥 ", "#3c3836"}}},
            },
            section_b = {
            },
            section_c = {
              {type = "coloreds", custom = false, name = "githead"},
            }
          }
        }, status_line = {
          left = {
            section_a = {
              {type = "string", custom = false, name = "tab_mode"},
            },
            section_b = {
              {type = "string", custom = false, name = "hovered_size"},
            },
            section_c = {
              {type = "string", custom = false, name = "hovered_path"},
              {type = "coloreds", custom = false, name = "count", params = "true"},
            },
          },
          right = {
            section_a = {
              {type = "string", custom = false, name = "cursor_position"},
            },
            section_b = {
              {type = "string", custom = false, name = "hovered_file_extension", params = {true}},
            },
            section_c = {
              {type = "string", custom = false, name = "hovered_size"},
            }
          }
        },
      })
      require("yatline-githead"):setup({
        show_branch = true,
        branch_prefix = "on",
        prefix_color = "white",
        branch_color = "blue",
        branch_symbol = "",
        branch_borders = "()",

        commit_color = "bright magenta",
        commit_symbol = "@",

        show_behind_ahead = true,
        behind_color = "bright magenta",
        behind_symbol = "⇣",
        ahead_color = "bright magenta",
        ahead_symbol = "⇡",

        show_stashes = true,
        stashes_color = "bright magenta",
        stashes_symbol = "$",

        show_state = true,
        show_state_prefix = true,
        state_color = "red",
        state_symbol = "~",

        show_staged = true,
        staged_color = "bright yellow",
        staged_symbol = "+",

        show_unstaged = true,
        unstaged_color = "bright yellow",
        unstaged_symbol = "!",

        show_untracked = true,
        untracked_color = "blue",
        untracked_symbol = "?",
      })
    '';
  };

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.initlua
  ];
}
