{
  programs.zen-browser.profiles."default".sine = {
    enable = true;

    mods = [
      "cfafe94c-5a29-4dae-8489-6be514185474" # Better Sidebar
      "e9dae25b-2ddd-4245-8581-a6dcf6d35b82" # Zen Custom URL Bar
      "dialog-fix"                            # Dialog Fix
      "context-menu-icons"                    # Context Menu Icons
      "ad97bb70-0066-4e42-9b5f-173a5e42c6fc" # SuperPins
      "4578o3ht1-udfpkbxz7-hllpxjbl5"          # zen-ghost-tabs
      "e4q4p9w9z-ilu1yco2x-mtgwbz8ry"          # Zen-back-forward
      "58649066-2b6f-4a5b-af6d-c3d21d16fc00" # Private Mode Highlighting
      "Nebula"                                # Nebula
      "floating-statusbar"                    # Floating Statusbar
      "9ncndahtq-c42bbp9go-a2374oofy"          # remove-tab-x
      "6f11c932-b992-433e-8c80-56a613cc511e" # Left close button
    ];
  };

  programs.zen-browser.profiles."default".settings = {
    # Zen Custom URL Bar
    "mod.zencustomurlbar.useanimation" = true;
    "mod.zencustomurlbar.scale" = "1";
    "mod.zencustomurlbar.blur" = "0px";
    "mod.zencustomurlbar.brightness" = "0.7";
    "mod.zencustomurlbar.borderradius" = "12px";
    "mod.zencustomurlbar.usefromzen" = true;
    "mod.zencustomurlbar.customcolor" = "rgba(23, 23, 26, 1)";
    "mod.zencustomurlbar.transparentvalue" = "15%";

    # Context Menu Icons
    "svg.context-properties.content.enabled" = true;
    "cmi-Switch-Icon-Package" = 1; # FluentUI
    "cmi-Switch-Gecko-Branch" = 1; # Zen
    "cmi-fold-item-IDs" = "";
    "cmi-menuseparator-opacity" = "0.5";
    "cmi-Hide-Bookmark-Element" = 0;
    "cmi-Auto-Hide-BookmarkBar" = 0;
    "cmi-Padding-Container" = "30px";

    # Context Menu Icons: FluentUI spacing
    "cmi-checkmark-margin-left_1" = "6px";
    "cmi-checkmark-margin-left_cover_1" = "8px";
    "cmi-checkmark-margin-right_1" = "8px";
    "cmi-checkmark-margin-right_cover_1" = "10px";
    "cmi-non-checkmark-subitems-padding_1" = "24px";
    "cmi-extension-icon-leftmargin_1" = "0px";
    "cmi-menu-text-leftmargin_1" = "0px";
    "cmi-fluentui-icons-leftmargin" = "6px";
    "cmi-fluentui-text-leftmargin" = "8px";

    # Context Menu Icons: ZenUI spacing
    "cmi-checkmark-margin-left_2" = "6px";
    "cmi-checkmark-margin-left_cover_2" = "6px";
    "cmi-checkmark-margin-right_2" = "8px";
    "cmi-checkmark-margin-right_cover_2" = "8px";
    "cmi-non-checkmark-subitems-padding_2" = "24px";
    "cmi-extension-icon-leftmargin_2" = "0px";
    "cmi-menu-text-leftmargin_2" = "0px";
    "cmi-zenui-icons-leftmargin" = "6px";
    "cmi-zenui-text-leftmargin" = "12px";

    # SuperPins
    "uc.essentials.width" = "Normal";
    "uc.essentials.gap" = "Normal";
    "uc.pins.essentials-layout" = true;
    "uc.essentials.color-scheme" = "";
    "uc.essentials.box-like-corners" = false;
    "uc.essentials.same-height" = false;
    "uc.essentials.transition-speed" = "100ms";
    "uc.essentials.position" = "";
    "uc.pins.legacy-layout" = true;
    "uc.pins.bg" = true;
    "uc.pins.transition-speed" = "100ms";
    "zen.workspaces.show-workspace-indicator" = true;
    "zen.workspaces.indicator-position" = "";
    "browser.sessionstore.restore_pinned_tabs_on_demand" = false;
    "uc.pins.stay-at-top" = true;
    "uc.pins.active-bg" = false;
    "mod.superpins.pins.active-bg" = "";
    "uc.tabs.strikethrough-on-pending" = true;
    "uc.pins.separator-at-bottom" = false;
    "uc.tabs.show-separator" = "";
    "uc.tabs.dim-type" = "";
    "uc.pinned.height" = "";
    "uc.favicon.size" = "";
    "uc.workspace.icon.size" = "";
    "uc.workspace.current.icon.size" = "";
    "mod.superpins.essentials.grid-count" = "1";
    "mod.superpins.pins.grid-count" = "1";

    # Ghost Tabs
    "mod.ghost_tabs.saturation" = "0";
    "mod.ghost_tabs.opacity" = "50";
    "mod.ghost_tabs.bw_enabled" = false;

    # Private Mode Highlighting
    "uc.private-browsing-top-bar.highlighting-style" = "gradient";
    "uc.private-browsing-top-bar.border-style" = "default";
    "uc.private-browsing-top-bar.color" = "default";

    # Nebula: animations and effects
    "nebula-tab-switch-animation" = 5; # Zoom Out
    "nebula-tab-loading-animation" = 0; # No Animation
    "nebula-urlbar-animation" = 1;
    "nebula-bookmarks-autohide" = 0;
    "nebula-glow-gradient" = 0;
    "nebula-active-tab-glow" = 0;
    "nebula-workspace-style" = 1;
    "nebula-default-sound-style" = 1;

    # Nebula: behaviour
    "nebula-macos-style-buttons" = false;
    "nebula-tabs-no-shadow" = false;
    "nebula-disable-container-styling" = false;
    "nebula-pinned-tabs-bg" = true;
    "nebula-remove-workspace-indicator" = true;
    "nebula-turn-off-zen-menu-icon" = true;
    "nebula-disable-menu-animations" = true;
    "nebula-essentials-gray-icons" = false;
    "nebula-folder-styling" = true;
    "nebula-nogaps-mod" = true;
    "nebula-pinned-extensions-mod" = false;

    # Nebula: glass and tint
    "var-nebula-glass-blur" = "32px";
    "var-nebula-glass-saturation" = "100%";
    "var-nebula-color-glass-light" = "rgba(255, 255, 255, 0.4)";
    "var-nebula-color-glass-dark" = "rgba(0, 0, 0, 0.4)";
    "var-nebula-ui-tint-light" = "rgba(255,255,255,0.2)";
    "var-nebula-ui-tint-dark" = "rgba(0,0,0,0.5)";
    "var-nebula-website-tint-light" = "rgba(255,255,255,0)";
    "var-nebula-website-tint-dark" = "rgba(0,0,0,0)";

    # Nebula: tab and shadow colors
    "var-nebula-tabs-minimum-light" = "rgba(255, 255, 255, 0.1)";
    "var-nebula-tabs-minimum-dark" = "rgba(0, 0, 0, 0.2)";
    "var-nebula-tabs-default-light" = "rgba(255,255,255,0.25)";
    "var-nebula-tabs-default-dark" = "rgba(0,0,0,0.35)";
    "var-nebula-tabs-hover-light" = "rgba(255,255,255,0.35)";
    "var-nebula-tabs-hover-dark" = "rgba(0,0,0,0.45)";
    "var-nebula-tabs-selected-light" = "rgba(255,255,255,0.45)";
    "var-nebula-tabs-selected-dark" = "rgba(0,0,0,0.55)";
    "var-nebula-color-shadow-light" = "rgba(255, 255, 255, 0.055)";
    "var-nebula-color-shadow-dark" = "rgba(0, 0, 0, 0.55)";

    # Nebula: layout
    "var-nebula-border-radius" = "13px";
    "var-nebula-essentials-width" = "60px";
    "var-nebula-workspace-grayscale" = "100%";

    # Remove Tab X
    "mod.remove-tab-x.scope" = "pinned";
  };
}