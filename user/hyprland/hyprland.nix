{ inputs, lib, pkgs, userSettings, systemSettings, ... }: 

{
  imports = [
    ./waybar.nix
    ./wlogout.nix
    ./notif.nix
  ];

  gtk.enable = true;

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
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
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
    hyprlock
    hypridle
    easyeffects
    grimblast
    libappindicator
  ];

  services.easyeffects.enable = true;

  home.file.".config/hypr/hypridle.conf".source = ../../assets/config/hypridle.conf;
  home.file.".config/hypr/hyprlock.conf".source = ../../assets/config/hyprlock.conf;
  home.file.".config/waybar/config.jsonc".source = ../../assets/config/waybar.jsonc;
  home.file.".config/waybar/style.css".source = ../../assets/config/waybar-style.css;
  home.file.".config/waybar/mocha.css".source = ../../assets/config/mocha.css;
  home.file.".config/waybar/scripts/caway.go".source = ../../assets/scripts/caway.go;
  home.file.".config/waybar/scripts/caway-go".source = ../../assets/scripts/caway-go;
  home.file.".config/waybar/scripts/caway".source = ../../assets/scripts/caway;
  home.file.".config/waybar/scripts/go.mod".source = ../../assets/scripts/go.mod;
  home.file.".config/waybar/scripts/getScratchOutput.sh".source= ../../assets/scripts/getScratchOutput.sh;
}