{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    enableZshIntegration = true;

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
  };
}
