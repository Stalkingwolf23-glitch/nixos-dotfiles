{
  flake.modules.homeManager.terminal = {
    programs.yazi.keymap = {
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
