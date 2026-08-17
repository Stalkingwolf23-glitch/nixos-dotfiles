{ self, ... }:

{
  flake.modules.nixos.kernel =
    { lib, pkgs, ... }:
    {
      # Cachy kernel is provided by the shared Chaotic package infrastructure.
      boot = {
        kernelPackages = pkgs.linuxPackages_cachyos;

        initrd = {
          verbose = false;
          kernelModules = [
            "amdgpu"
            "zfs"
          ];
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

  flake.modules.nixos.cocytus-system.imports = [ self.modules.nixos.kernel ];
}
