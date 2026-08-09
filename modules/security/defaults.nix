{
  flake.modules.nixos.security = {
    programs.gnupg.agent = {
      enable = true;
      # enableSSHSupport = true;
    };

    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
    security.polkit.enable = true;
    networking.firewall.enable = true;
  };
}
