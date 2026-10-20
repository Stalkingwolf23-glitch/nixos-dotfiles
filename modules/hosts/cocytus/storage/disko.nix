{self, ...}: {
  flake.modules.nixos.cocytus-disko = {
    imports = [self.modules.nixos.zfs-disko];
    networking.hostId = "8425e349";
    disko.devices.zpool.rpool.datasets = {
      "safe/persist" = {
        type = "zfs_fs";
        mountpoint = "/persist";
      };
    };
  };
}
