{ self, ... }:

{
  flake.modules.homeManager.qt =
    { config, ... }:
    let
      qt5Font = ''"Maple Mono NF CN,12,-1,5,50,0,0,0,0,0"'';
      qt6Font = ''"Maple Mono NF CN,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular,0,0"'';

      interface = {
        activate_item_on_single_click = 0;
        buttonbox_layout = 0;
        cursor_flash_time = 1000;
        dialog_buttons_have_icons = 1;
        double_click_interval = 400;
        gui_effects = "@Invalid()";
        keyboard_scheme = 2;
        menus_have_icons = true;
        show_shortcuts_in_context_menus = true;
        stylesheets = "@Invalid()";
        toolbutton_style = 4;
        underline_shortcut = 1;
        wheel_scroll_lines = 3;
      };

      troubleshooting = {
        force_raster_widgets = 1;
        ignored_applications = "@Invalid()";
      };
    in
    {
      qt = {
        enable = true;
        style.name = "kvantum";
        platformTheme.name = "qt6ct";

        qt5ctSettings = {
          Appearance = {
            color_scheme_path = "${config.xdg.configHome}/qt5ct/colors/noctalia.conf";
            custom_palette = true;
            icon_theme = "Papirus";
            standard_dialogs = "default";
          };
          Fonts = {
            fixed = qt5Font;
            general = qt5Font;
          };
          Interface = interface;
          Troubleshooting = troubleshooting;
        };

        qt6ctSettings = {
          Appearance = {
            color_scheme_path = "${config.xdg.configHome}/qt6ct/colors/noctalia.conf";
            custom_palette = true;
            icon_theme = "Papirus";
            standard_dialogs = "default";
          };
          Fonts = {
            fixed = qt6Font;
            general = qt6Font;
          };
          Interface = interface;
          Troubleshooting = troubleshooting;
        };
      };
    };

  flake.modules.homeManager.style.imports = [
    self.modules.homeManager.qt
  ];
}
