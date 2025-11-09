{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  home.file.".config/kitty/tab_bar.py".source = ../../assets/config/kitty_bar.py;

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
      dynamic_background_opacity yes
      background_opacity 0.9
      background_blur 1
      symbol_map U+e000-U+e00a,U+ea60-U+ebeb,U+e0a0-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ed00-U+efc1,U+f000-U+f2ff,U+f000-U+f2e0,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono
      confirm_os_window_close 0

      open_url_with default
      detect_urls yes

      tab_bar_edge bottom
      tab_bar_margin_height 1.0 1.0
      tab_bar_style custom
      tab_bar_align left
      tab_bar_min_tabs 1
      tab_switch_strategy previous
      tab_activity_symbol "*"
      active_tab_foreground #61afef
      active_tab_font_style none
      inactive_tab_foreground #303030
      inactive_tab_font_style none
      tab_title_template "{fmt.fg._689cc8}{activity_symbol}{fmt.fg.tab}{title}{fmt.fg._ff2942}{bell_symbol}"

      map alt+1 goto_tab 1
      map alt+2 goto_tab 2
      map alt+3 goto_tab 3
      map alt+4 goto_tab 4
      map alt+5 goto_tab 5 
      map alt+6 goto_tab 6
      map alt+7 goto_tab 7
      map alt+8 goto_tab 8
      map alt+9 goto_tab 9
      map alt+0 goto_tab 10
    '';
  };
}
