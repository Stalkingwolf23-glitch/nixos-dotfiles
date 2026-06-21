{ lib, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      background_blur = 5;
      background_opacity = lib.mkForce "0.5";

      cursor_trail = "1";

      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      tab_bar_min_tabs = 2;
      active_tab_font_style = "bold";
      inactive_tab_font_style = "bold";

      tab_title_template = "{index}: {title}";
      tab_title_max_length = 30;
    };

    keybindings = {
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
      "alt+6" = "goto_tab 6";
      "alt+7" = "goto_tab 7";
      "alt+8" = "goto_tab 8";
      "alt+9" = "goto_tab 9";

      "alt+h" = "neighboring_window left";
      "alt+l" = "neighboring_window right";
      "alt+k" = "neighboring_window up";
      "alt+j" = "neighboring_window down";
    };
  };
}
