{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages;
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
