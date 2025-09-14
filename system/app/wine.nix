{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wineWowPackages.staging
    winetricks
    protonup-qt
    protontricks
  ];
}