{ inputs, ... }:

{
  imports = [
    inputs.kickstart-nixvim.homeManagerModules.default
  ];

  programs.nixvim.enable = true;

  # Trying out Zed
  programs.zed-editor = {
    enable = true;
    userSettings = {
      vim_mode = true;
      tab_bar.show = true;
      tabs = {
        show_diagnostics = "errors";
      };
      indent_guides = {
        enable = true;
        coloring = "indent_aware";
      };
      inlay_hints = {
        enabled = true;
      };
      inactive_opacity = "0.5";
      auto_install_extensions = true;
      outline_panel = {
        dock = "right";
      };
      collaboration_panel = {
        dock = "left";
      };
      notification_panel = {
        dock = "left";
      };
      chat_panel = {
        dock = "left";
      };
      hour_format = "hour24";
      auto_update = false;
      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [
              ".env"
              "env"
              ".venv"
              "venv"
            ];
            activate_script = "default";
          };
        };

        # File Syntax
        file_types = {
          JSON = [
            "json"
            "jsonc"
            "*.code-snippets"
          ];
        };
        languages = {
          Markdown = {
            formatter = "prettier";
          };
          JSON = {
            formatter = "prettier";
          };
          TOML = {
            formatter = "taplo";
          };
        };

        lsp = {
          nix = {
            binary = {
              path_lookup = true;
            };
          };
          settings = {
            dialyzerEnabled = true;
          };
        };
      };
    };
  };
}
