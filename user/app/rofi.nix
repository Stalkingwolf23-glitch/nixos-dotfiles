{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-games
    ];
  };

  home.file.".config/rofi-games/config.toml".text = ''
    hide_entries_without_box_art = false
    fallback_to_icons = true
    box_art_dir = "/home/stalkingwolf/.config/rofi/box-art"

    [sort]
    order = "frecency"
    reverse = true

    [[entries]]
    title = "Honkers Railway"
    launch_command = "honkers-railway-launcher"
    path_box_art = "honkaiRail.png"
  '';

  home.file.".config/rofi/".recursive = true;
  home.file.".config/rofi/".source = ../../assets/config/rofi;
}
