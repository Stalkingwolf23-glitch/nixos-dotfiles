{
  pkgs,
  nix-cachyos-kernel,
  ...
}:

{
  nixpkgs.overlays = [ nix-cachyos-kernel.overlays.default ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
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
      "video=DP-1:2560x1440@144"
      "video=HDMI-A-2:1920x1080@60"
    ];
  };

  systemd.packages = [
    (pkgs.callPackage ../app/pkgs/dmemcg-booster.nix { })
  ];

  systemd.services.dmemcg-booster-system = {
    overrideStrategy = "asDropin";
    wantedBy = [ "multi-user.target" ];
  };

  systemd.user.services.dmemcg-booster-user = {
    overrideStrategy = "asDropin";
    wantedBy = [ "graphical-session-pre.target" ];
  };
}
