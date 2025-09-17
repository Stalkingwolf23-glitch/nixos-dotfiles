{ pkgs, ... }:

{
  # Fonts are nice to have
  fonts.packages = with pkgs; [
    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.noto
    powerline
    cascadia-code
    (pkgs.callPackage ./monolisa.nix { })
  ];
  fonts.fontDir.enable = true;
}