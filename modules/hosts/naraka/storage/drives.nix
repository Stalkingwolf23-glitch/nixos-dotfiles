{
  flake.modules.nixos.naraka-drives = {
    fileSystems = {
      "/raurava" = {
        device = "raurava";
        fsType = "zfs";
      };

      "/raurava/images" = {
        device = "raurava/images";
        fsType = "zfs";
      };

      "/raurava/general" = {
        device = "raurava/general";
        fsType = "zfs";
      };

      "/raurava/music" = {
        device = "raurava/music";
        fsType = "zfs";
      };
    };

    systemd.services.zfs-mount.enable = false;
  };
}
