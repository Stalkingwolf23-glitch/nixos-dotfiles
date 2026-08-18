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
        lollypop
      ];
    };

  flake.modules.homeManager.applications.imports = [ self.modules.homeManager.misc ];

  flake.modules.nixos.apps-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [
        ".config/MusicBrainz"
        ".config/YouTube Music"
        ".config/obsidian"
        ".local/share/applications"
      ];
      files = [ ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.apps-preservation ];
}
