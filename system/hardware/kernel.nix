{
  pkgs,
  nix-cachyos-kernel,
  ...
}:

{
  nixpkgs.overlays = [ nix-cachyos-kernel.overlays.default ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_zen;
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
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
    kernelParams = [
      "split_lock_detect=off"
      "amdgpu.dcdebugmask=0x400"
    ];
  };
}
