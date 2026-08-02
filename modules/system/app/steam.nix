{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraProfile = ''
        unset TZ
      '';
    };
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };
}
