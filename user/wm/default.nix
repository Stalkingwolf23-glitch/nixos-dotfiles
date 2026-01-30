{
  pkgs,
  ...
}:
{
  imports = [
    ./noctalia.nix
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
    # youtube-music
    pear-desktop
    steamtinkerlaunch
    zathura
    zsh
    qview
  ];

  services.vicinae = {
    enable = true;
  };

  home.file.".config/niri/config.kdl".source = ../../assets/config/niri.kdl;
  home.file.".config/equibop/themes".recursive = true;
  home.file.".config/equibop/themes".source = ../../assets/config/vesktop;
  home.file.".config/ghostty".recursive = true;
  home.file.".config/ghostty".source = ../../assets/config/ghostty;
}
