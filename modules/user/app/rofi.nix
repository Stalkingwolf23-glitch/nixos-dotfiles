{
  pkgs,
  ...
}:
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
    show_entry_source_text = false
    box_art_dir = "/home/stalkingwolf/.config/rofi/box-art"

    [sort]
    order = "frecency"
    reverse = false

    [[entries]]
    title = "Monster Hunter: World"
    hide = true

    [[entries]]
    title = "Tabletop Simulator"
    hide = true
  '';
}
