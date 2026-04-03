{
  pkgs,
  ...
}:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
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
    initrd.kernelModules = [
      "ahci"
      "xhci_pci"
      "amdgpu"
    ];
    kernelModules = [
      "sr_mod"
      "usb-storage"
    ];
    kernel.sysctl."kernel.sysrq" = 502;
    boot.kernelParams = [
      "split_lock_detect=off"
      "amdgpu.ppfeaturemask=0xfffd3fff"
    ];
  };
}
