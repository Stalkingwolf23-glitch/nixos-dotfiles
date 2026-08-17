{
  flake.modules.nixos.desktop = {
    programs.nm-applet = {
      enable = true;
      indicator = true;
    };
  };
}
