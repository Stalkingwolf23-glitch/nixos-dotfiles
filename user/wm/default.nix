{
  pkgs,
  ...
}:
{
  imports = [
    ./noctalia.nix
    ./vicinae.nix
    ./swayidle.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    moonlight-qt
    equibop
    wlr-randr
    polkit_gnome
    pamixer
    pavucontrol
    wl-clipboard
    cliphist
    # swww
    swaylock
    # hyprlock
    # hypridle
    easyeffects
    # grimblast
    libappindicator
    playerctl
    youtube-music
    steamtinkerlaunch
    zathura
    zsh
    qview
  ];

  home.file.".config/niri/config.kdl".source = ../../assets/config/niri.kdl;
  home.file.".config/equibop/themes".recursive = true;
  home.file.".config/equibop/themes".source = ../../assets/config/vesktop;
  home.file.".config/ghostty".recursive = true;
  home.file.".config/ghostty".source = ../../assets/config/ghostty;
}
