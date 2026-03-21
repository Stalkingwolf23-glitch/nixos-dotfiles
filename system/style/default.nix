{
  pkgs,
  ...
}:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      qt.enable = true;
      qt.platform = "qtct";
    };
  };

  fonts.packages = with pkgs; [
    # Fonts
    material-design-icons
    moralerspace
  ];
  fonts.fontDir.enable = true;
}
