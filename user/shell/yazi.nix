{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
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
    };
    plugins = {
      "starship" = pkgs.yaziPlugins.starship;
      "smart-enter" = pkgs.yaziPlugins.smart-enter;
      "wl-clipboard" = pkgs.yaziPlugins.wl-clipboard;
      "yatline" = pkgs.yaziPlugins.yatline;
      "rich-preview" = pkgs.yaziPlugins.rich-preview;
      "no-status" = pkgs.yaziPlugins.no-status;
    };

  };
}
