{ lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        cursorline = true;
        indent-guides.render = true;
        whitespace.render = {
          space = "none";
          tab = "all";
          nbsp = "all";
          newline = "none";
        };
        soft-wrap.enable = true;
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
            "file-modification-indicator"
          ];
          center = [ ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-type"
          ];
          separator = "│";
        };
      };
      keys.normal = {
        y = "yank_to_clipboard";
        p = "paste_clipboard_after";
        P = "paste_clipboard_before";
        d = "delete_selection";
        c = "change_selection";
      };
      keys.select = {
        y = "yank_to_clipboard";
        p = "paste_clipboard_after";
        P = "paste_clipboard_before";
        d = "delete_selection";
        c = "change_selection";
      };
    };

    languages = {
      language-server = {
        nixd.command = lib.getExe pkgs.nixd;
        lua-language-server.command = lib.getExe pkgs.lua-language-server;
        typescript-language-server = {
          command = lib.getExe pkgs.typescript-language-server;
          args = [ "--stdio" ];
        };
        vscode-css-language-server = {
          command = lib.getExe' pkgs.vscode-langservers-extracted "vscode-css-language-server";
          args = [ "--stdio" ];
        };
      };
      language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
          formatter.command = lib.getExe pkgs.nixfmt;
          auto-format = true;
        }
        {
          name = "lua";
          language-servers = [ "lua-language-server" ];
          formatter = {
            command = lib.getExe pkgs.stylua;
            args = [
              "--indent-type"
              "Spaces"
              "--indent-width"
              "2"
              "-"
            ];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
        }
        {
          name = "javascript";
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
        }
        {
          name = "css";
          language-servers = [ "vscode-css-language-server" ];
          auto-format = true;
        }
      ];
    };
  };
}
