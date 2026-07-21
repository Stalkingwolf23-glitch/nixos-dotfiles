{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    enableZshIntegration = true;
    settings = {
      mgr = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
      };

      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
      };

      plugin = {
        prepend_previewers = [
          {
            url = "*.md";
            run = "rich-preview";
          }
          {
            url = "*.json";
            run = "rich-preview";
          }
          {
            url = "*.csv";
            run = "rich-preview";
          }
          {
            url = "*.rst";
            run = "rich-preview";
          }
          {
            url = "*.ipynb";
            run = "rich-preview";
          }
        ];
      };
    };

    plugins = {
      "smart-enter" = pkgs.yaziPlugins.smart-enter;
      "clipboard" = pkgs.yaziPlugins.clipboard;
      "yatline" = pkgs.yaziPlugins.yatline;
      "yatline-catppuccin" = pkgs.yaziPlugins.yatline-catppuccin;
      "yatline-githead" = pkgs.yaziPlugins.yatline-githead;
      "rich-preview" = pkgs.yaziPlugins.rich-preview;
      "restore" = pkgs.yaziPlugins.restore;
      "omni-trash" = pkgs.yaziPlugins.omni-trash;
      "full-border" = pkgs.yaziPlugins.full-border;
      "lazygit" = pkgs.yaziPlugins.lazygit;
    };

    initLua = ''
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

    keymap = {
      mgr = {
        prepend_keymap = [
          {
            on = "l";
            run = "plugin smart-enter";
            desc = "Enter child directory or open file";
          }
          {
            on = "y";
            run = [
              "yank"
              "plugin clipboard -- --action=copy"
            ];
            desc = "Yank selected files (copy)";
          }
          {
            on = "x";
            run = [
              "yank --cut"
              "plugin clipboard -- --action=copy"
            ];
            desc = "Yank selected files (cut)";
          }
          {
            on = "<C-p>";
            run = "plugin clipboard -- --action=paste";
            desc = "Paste yanked system clipboard files";
          }
          {
            on = [
              "g"
              "n"
            ];
            run = "cd ~/local/nixos";
            desc = "Go Nix config";
          }
          {
            on = [
              "g"
              "s"
            ];
            run = "cd /mnt/osiris/Games/Steam/steamapps/common";
            desc = "Go Steam Games";
          }
          {
            on = [
              "g"
              "i"
            ];
            run = "plugin lazygit";
            desc = "Opens lazygit";
          }
          {
            on = "u";
            run = "plugin restore";
            desc = "Restore last deleted file/folder";
          }
          {
            on = "R";
            run = "plugin omni-trash";
            desc = "Open Trash";
          }
        ];
      };
    };
  };
}
