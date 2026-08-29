{ self, ... }:

{
  flake-file.inputs.nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

  flake.modules.nixos.kernel =
    {
      lib,
      pkgs,
      inputs,
      config,
      ...
    }:
    {
      nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
      nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
      nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];

      boot = {
        kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
        zfs = {
          package = config.boot.kernelPackages.zfs_cachyos;
          forceImportRoot = false;
        };
        kernelModules = [ "btrfs" ];
        supportedFilesystems.zfs = true;
        supportedFilesystems.btrfs = true;
        initrd = {
          supportedFilesystems = [
            "zfs"
            "btrfs"
          ];
          verbose = false;
          kernelModules = [
            "amdgpu"
            "zfs"
            "btrfs"
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
