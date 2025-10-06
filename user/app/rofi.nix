{ pkgs, ... }:

{
  programs.rofi-wayland = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-games
      rofi-nerdy
    ];
  };
}
