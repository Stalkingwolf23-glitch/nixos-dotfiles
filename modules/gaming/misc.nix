{
  flake.modules.homeManager.misc = { pkgs, ... }:
    {
      home.packages = with pkgs; [
        xwayland-satellite
        # moonlight-qt # Just for streaming from laptop when needed
        wlr-randr
        pamixer
        pavucontrol
        wl-clipboard
        cliphist
        easyeffects
        libappindicator
        playerctl
        pear-desktop
        steamtinkerlaunch
        zathura
        zsh
        qimgv
        picard
      ];

      programs.lutris.enable = true;
    };
}
