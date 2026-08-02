{
  home.file = {
    ".config/Kvantum" = {
      recursive = true;
      source = ../../assets/config/Kvantum;
    };

    ".config/qt6ct/qt6ct.conf".text = ''
      [Appearance]
      color_scheme_path=/home/stalkingwolf/.config/qt6ct/colors/noctalia.conf
      custom_palette=true
      icon_theme=Papirus
      standard_dialogs=default
      style=Kvantum

      [Fonts]
      fixed="Maple Mono NF CN,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0"
      general="Maple Mono NF CN,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0"

      [Interface]
      activate_item_on_single_click=1
      buttonbox_layout=0
      cursor_flash_time=1000
      dialog_buttons_have_icons=1
      double_click_interval=400
      gui_effects=@Invalid()
      keyboard_scheme=2
      menus_have_icons=true
      show_shortcuts_in_context_menus=true
      stylesheets=@Invalid()
      toolbutton_style=4
      underline_shortcut=1
      wheel_scroll_lines=3

      [SettingsWindow]
      geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x4\xee\0\0\x5g\0\0\0\0\0\0\0\0\0\0\x4\xee\0\0\x5g\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\x4\xee\0\0\x5g)

      [Troubleshooting]
      force_raster_widgets=1
      ignored_applications=@Invalid()
    '';

    ".config/qt5ct/qt5ct.conf".text = ''
      [Appearance]
      color_scheme_path=/home/stalkingwolf/.config/qt5ct/colors/noctalia.conf
      custom_palette=true
      icon_theme=Papirus
      standard_dialogs=default
      style=Kvantum

      [Fonts]
      fixed="Maple Mono NF CN,12,-1,5,50,0,0,0,0,0"
      general="Maple Mono NF CN,12,-1,5,50,0,0,0,0,0"

      [Interface]
      activate_item_on_single_click=1
      buttonbox_layout=0
      cursor_flash_time=1000
      dialog_buttons_have_icons=1
      double_click_interval=400
      gui_effects=@Invalid()
      keyboard_scheme=2
      menus_have_icons=true
      show_shortcuts_in_context_menus=true
      stylesheets=@Invalid()
      toolbutton_style=4
      underline_shortcut=1
      wheel_scroll_lines=3

      [SettingsWindow]
      geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x4\xe4\0\0\x5\x61\0\0\0\0\0\0\0\0\0\0\x4\xe4\0\0\x5\x61\0\0\0\x1\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\x4\xe4\0\0\x5\x61)

      [Troubleshooting]
      force_raster_widgets=1
      ignored_applications=@Invalid()
    '';
  };
}
