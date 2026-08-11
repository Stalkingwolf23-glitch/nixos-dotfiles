{
  flake.modules.nixos.desktop = {
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
    security.polkit.enable = true;
  };

}
