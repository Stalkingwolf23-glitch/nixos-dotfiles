{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./dolphin.nix
    ./rofi.nix
    ./zen.nix
    ./noctalia.nix
    ./xdg.nix

    inputs.kickstart-nixvim.homeManagerModules.default

  ];

  services.vicinae.enable = true;
  programs.lutris.enable = true;
  programs.nixvim.enable = true;
}
