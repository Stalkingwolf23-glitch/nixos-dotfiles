{
  imports = [
    ./doas.nix
    ./firewall.nix
    ./user.nix
  ];

  programs.gnupg.agent = {
    enable = true;
    # enableSSHSupport = true;
  };

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
