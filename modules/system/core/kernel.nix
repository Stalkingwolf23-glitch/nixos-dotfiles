{
  pkgs,
  inputs,
  ...
}:

{
  boot = {
    # Cachy kernel from chaotic nyx set in steam.nix
    kernelPackages = pkgs.linuxPackages_cachyos; # No real benefits, for the sake of it
    consoleLogLevel = 3;
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      timeout = 5;
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
      "systemd.show_status=auto"
      "vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166"
      "vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173"
      "vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200"
    ];
  };
}
