{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rgd
    xwayland-satellite
    # moonlight-qt # Just for streaming from laptop when needed
    wlr-randr
    pamixer
    pavucontrol
    wl-clipboard
    cliphist
    swaylock
    easyeffects
    libappindicator
    playerctl
    pear-desktop
    steamtinkerlaunch
    zathura
    zsh
    qimgv
    picard
    evtest
  ];

  programs.lutris.enable = true;
}
