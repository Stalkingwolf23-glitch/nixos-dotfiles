{ pkgs, ... }:

{
  boot = {
    # Cachy kernel from chaotic nyx set in steam.nix
    kernelPackages = pkgs.linuxPackages_cachyos; # No real benefits, for the sake of it
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 10;
        consoleMode = "max"; # Test to see if this will help the bootloader
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      timeout = 5;
    };

    initrd = {
      verbose = false;
      kernelModules = [ "amdgpu" ]; # Enables REISUB
    };
    kernel.sysctl."kernel.sysrq" = 502; # Reboot system if lock up
    kernel.sysctl."vm.max_map_count" = 2147483642; # For some games that require more nmap regions
    kernelParams = [
      "split_lock_detect=off" # Zen 4 CPU not affected, keeping for future upgrades
      "boot.shell_on_fail" # Drops to temp shell if boot fails
      "nowatchdog" # disables both the softlockup and NMI hardlockup detectors
      # Catppuccin theming for TTY
      "vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166"
      "vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173"
      "vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200"
    ];
  };
}
