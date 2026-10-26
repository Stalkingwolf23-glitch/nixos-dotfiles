{
  disko.devices = {
    disk = {
      hdd1 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000DM004-2U9104_WFN9DPY1";
        content = {
          type = "gpt";
          partitions.zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "raurava";
            };
          };
        };
      };
      hdd2 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000DM004-2U9104_WFN9DQXH";
        content = {
          type = "gpt";
          partitions.zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "raurava";
            };
          };
        };
      };
      hdd3 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000DM004-2U9104_WFN9BT5P";
        content = {
          type = "gpt";
          partitions.zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "raurava";
            };
          };
        };
      };
      hdd4 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000DM004-2CV104_ZFN57C94";
        content = {
          type = "gpt";
          partitions.zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "raurava";
            };
          };
        };
      };
    };
    zpool.raurava = {
      type = "zpool";
      mode.topology = {
        type = "topology";
        vdev = [
          {
            mode = "raidz2";
            members = ["hdd1" "hdd2" "hdd3" "hdd4"];
          }
        ];
      };
      options = {
        ashift = "12";
        autotrim = "on";
      };
      rootFsOptions = {
        compression = "lz4";
        atime = "off";
        acltype = "posixacl";
        aclmode = "passthrough";
      };
      datasets = {
        images = {
          type = "zfs_fs";
          mountpoint = "/raurava/images";
          options.canmount = "noauto";
        };
        music = {
          type = "zfs_fs";
          mountpoint = "/raurava/music";
          options.canmount = "noauto";
        };
        general = {
          type = "zfs_fs";
          mountpoint = "/raurava/general";
          options.canmount = "noauto";
        };
      };
    };
  };
}
