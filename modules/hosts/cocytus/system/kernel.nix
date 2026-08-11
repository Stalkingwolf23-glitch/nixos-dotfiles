{
  flake.modules.nixos.kernel =
    { lib, pkgs, ... }:
    {
      boot = {
        # Cachy kernel is provided by the shared Chaotic package infrastructure.
        kernelPackages = pkgs.linuxPackages_cachyos;
        loader = {
          # grub.enable = false;
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

        initrd = {
          verbose = false;
          kernelModules = [ "amdgpu" ];
        };
        kernel.sysctl."kernel.sysrq" = 502;
        kernel.sysctl."vm.max_map_count" = 2147483642;
        kernelParams = [
          "split_lock_detect=off"
          "boot.shell_on_fail"
          "nowatchdog"
          "vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166"
          "vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173"
          "vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200"
        ];
      };
    };
}
