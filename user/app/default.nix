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
    ./mangohud.nix
    inputs.kickstart-nixvim.homeManagerModules.default
  ];

  nixpkgs.overlays = [
    # Skipping tests while upstream sorts it out, revert once
    # Hydra consistently builds openldap green.
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (_: {
        doCheck = false;
      });
    })
  ];

  home.packages = with pkgs; [
    rgd
    xwayland-satellite
    # moonlight-qt # Just for streaming from laptop when needed
    equibop
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
    picard
    evtest
  ];

  services.vicinae.enable = true;
  programs.lutris.enable = true;
  programs.nixvim.enable = true;
}
