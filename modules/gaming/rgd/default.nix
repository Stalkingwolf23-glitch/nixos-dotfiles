{
  inputs,
  self,
  ...
}: {
  pins.rgd = {
    url = "https://github.com/Rolv-Apneseth/rgd";
    flake = false;
  };

  flake.modules.homeManager.gameLauncher = {pkgs, ...}: {
    nixpkgs.overlays = [
      (import ./_overlay.nix inputs)
    ];

    programs.rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-games
      ];
    };
    home.packages = with pkgs; [
      rgd
    ];
  };

  flake.modules.homeManager.gaming.imports = [self.modules.homeManager.gameLauncher];
}
