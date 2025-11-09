{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./noctalia.nix
    ./vicinae.nix
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
      env = NIXOS_OZONE_WL, 1
      ${builtins.readFile ../../assets/config/hyprland.conf}
      exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
    '';
    plugins = [
      inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
      inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
      inputs.hyprXPrimary.packages.${pkgs.system}.default
    ];
  };

  home.packages = with pkgs; [
    equibop
    wlr-randr
    polkit_gnome
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
    playerctl
    youtube-music
    steamtinkerlaunch
    zathura
    zsh
    git
    mangohud
    qview
  ];

  services.easyeffects.enable = true;

  home.file.".config/hypr/hypridle.conf".source = ../../assets/config/hypridle.conf;
  home.file.".config/hypr/hyprlock.conf".source = ../../assets/config/hyprlock.conf;
  home.file.".config/equibop/themes".recursive = true;
  home.file.".config/equibop/themes".source = ../../assets/config/vesktop;
}
