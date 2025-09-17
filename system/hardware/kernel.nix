{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    consoleLogLevel = 0;
    loader = {
      grub = {
        enable = false;
        device = "/dev/vda";
        useOSProber = true;
      };
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
  };
}
