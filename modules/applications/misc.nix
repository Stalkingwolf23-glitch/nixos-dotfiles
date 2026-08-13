{ self, ... }:

{
  flake.modules.homeManager.misc =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
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
        obsidian
      ];
    };

  flake.modules.homeManager.applications.imports = [ self.modules.homeManager.misc ];
}
