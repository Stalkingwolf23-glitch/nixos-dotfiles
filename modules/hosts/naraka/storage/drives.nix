{
  flake.modules.nixos.naraka-drives = {
    boot.zfs.extraPools = ["raurava"];
    fileSystems."/raurava/images" = {
      device = "raurava/images";
      fsType = "zfs";
    };
    fileSystems."/raurava/music" = {
      device = "raurava/music";
      fsType = "zfs";
    };
    fileSystems."/raurava/general" = {
      device = "raurava/general";
      fsType = "zfs";
    };
  };
}
