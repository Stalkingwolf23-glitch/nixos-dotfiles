{ pkgs, ... }:

{
  # Fonts are nice to have
  fonts.packages = with pkgs; [
    # Fonts
    material-design-icons
  ];
  fonts.fontDir.enable = true;
}
