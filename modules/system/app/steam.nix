{ pkgs, inputs, ... }:

{
  flake-file.inputs.chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  nixpkgs.overlays = [ inputs.chaotic.overlays.default ];
  nixpkgs.config.allowUnfree = true;

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
}
