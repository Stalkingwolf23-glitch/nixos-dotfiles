{ inputs, pkgs, ... }:

{
  programs.steam.enable = true;
  # programs.steam.extraCompatPackages = [ inputs.cachy-proton.packages.${pkgs.system}.proton-cachyos ];
  environment.systemPackages = [ pkgs.steam ];

  hardware.graphics = {
    enable32Bit = true;
    extraPackages = [ pkgs.gamescope-wsi ];
    extraPackages32 = [ pkgs.pkgsi686Linux.gamescope-wsi ];
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
    args = [
      "--rt"
      "--expose-wayland"
    ];
  };
}

