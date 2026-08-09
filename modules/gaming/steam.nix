{
  flake.modules.nixos.steam = { pkgs, ... }:
    {
      nix.settings.extra-substituters = [ "https://nix-gaming.cachix.org" ];
      nix.settings.extra-trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];

      environment.systemPackages = with pkgs; [
        wineWow64Packages.staging
        winetricks
        protontricks
        gamemode
      ];

      programs.steam = {
      enable = true;
      package = pkgs.steam.override {
        extraProfile = ''
          unset TZ
        '';
      };
      extraPackages = with pkgs; [
        gamescope-wsi
      ];
      extraCompatPackages = with pkgs; [
        proton-cachyos
      ];
    };

    programs.gamescope = {
      enable = true;
      capSysNice = false;
    };
    };
}
