{
  flake.modules.nixos.x86-boot = {
    boot.loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 10;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      timeout = 5;
    };
    boot.initrd.systemd = {
      enable = true;
      tpm2.enable = true;
    };
  };
}
