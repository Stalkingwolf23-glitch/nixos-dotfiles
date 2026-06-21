{
  pkgs,
  nix-cachyos-kernel,
  ...
}:

{
  nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    consoleLogLevel = 3;
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      timeout = 0;
    };
    plymouth = {
      enable = true;
    };

    initrd = {
      verbose = false;
      kernelModules = [
        "ahci"
        "xhci_pci"
        "amdgpu"
      ];
    };
    kernelModules = [
      "sr_mod"
      "usb-storage"
    ];
    kernel.sysctl."kernel.sysrq" = 502;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_priority=3"
      "systemd.show_status=auto"
      "split_lock_detect=off"
      "boot.shell_on_fail"
      "rd.systemd.show_status=auto"
    ];
  };
}
