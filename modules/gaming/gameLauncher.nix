{
  inputs,
  ...
}:

{
  flake-file.inputs.rgd = {
    url = "github:Rolv-Apneseth/rgd";
    flake = false;
  };

  flake.modules.homeManager.gameLauncher = { pkgs, ... }:
    {
    nixpkgs.overlays = [
      (import ../overlays/rgd.nix inputs)
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
}
