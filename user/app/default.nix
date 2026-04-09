{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./dolphin.nix
    ./rofi.nix
    ./zen.nix
    ./noctalia.nix
    ./xdg.nix

    inputs.kickstart-nixvim.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    rgd
    xwayland-satellite
    # moonlight-qt # Just for streaming from laptop when needed
    (pkgs.equibop.override { electron = pkgs.electron_40; })
    wlr-randr
    polkit_gnome
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
    qview
  ];

  services.vicinae.enable = true;
  programs.lutris.enable = true;
  programs.nixvim.enable = true;
}
