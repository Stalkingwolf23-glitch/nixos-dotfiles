{
  flake.modules.nixos.cocytus-storage = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/5334d86b-2c0f-4784-b126-d1acced8a532";
      fsType = "ext4";
      options = [ "nofail" ];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/3F43-74F1";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
        "nofail"
      ];
    };

    fileSystems."/mnt/osiris" = {
      device = "/dev/disk/by-uuid/6a743d8f-c790-4e6f-b78b-1e8b43a932f2";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "noatime"
        "nofail"
      ];
    };

    fileSystems."/mnt/backup" = {
      device = "/dev/disk/by-uuid/27afc96a-db74-4954-bd3d-a139617298f1";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "noatime"
        "nofail"
      ];
    };

    fileSystems."/mnt/wd_linux" = {
      device = "/dev/disk/by-uuid/f58af5bc-59e4-482d-ab77-7931a2e5e72e";
      fsType = "ext4";
      options = [ "nofail" ];
    };
  };
}
