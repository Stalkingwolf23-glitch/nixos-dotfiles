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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };
}
