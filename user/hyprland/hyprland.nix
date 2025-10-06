{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./waybar.nix
    ./wlogout.nix
    ./notif.nix
  ];

  gtk.enable = true;
  qt = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    extraConfig = ''
      ${builtins.readFile ../../assets/config/hyprland.conf}
      exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
      exec-once = hyprctl plugin load "$HYPR_PLUGIN_DIR/lib/libhyprexpo.so"
    '';
    plugins = [
      inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
      inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
      inputs.hyprXPrimary.packages.${pkgs.system}.default
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
  };

  home.packages = with pkgs; [
    wlr-randr
    polkit_gnome
    mako
    pamixer
    pavucontrol
    wl-clipboard
    cliphist
    swww
    hyprpaper
    hyprlock
    hypridle
    easyeffects
    grimblast
    libappindicator
    playerctl
    youtube-music
    activate-linux
    steamtinkerlaunch
    deepfilternet
    zathura
  ];

  services.easyeffects.enable = true;

  home.file.".config/hypr/hypridle.conf".source = ../../assets/config/hypridle.conf;
  home.file.".config/hypr/hyprlock.conf".source = ../../assets/config/hyprlock.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ../../assets/config/hyprpaper.conf;
  home.file.".config/waybar/".recursive = true;
  home.file.".config/waybar/".source = ../../assets/config/waybar;
}
