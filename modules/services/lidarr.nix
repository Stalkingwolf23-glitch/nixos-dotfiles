{self, ...}: {
  flake.modules.nixos.lidarr = {
    services.lidarr = {
      enable = false;
    };

    fileSystems."/mnt/lidarr" = {
      device = "100.111.117.36:/mnt/wd_linux/Stuff/Torrents/Music";
      fsType = "nfs";
      options = [
        "rw"
        "vers=4"
        "x-systemd.automount"
        "x-systemd.idle-timeout=600"
        "x-systemd.mount-timeout=15s"
        "nofail"
      ];
    };
  };

  flake.modules.nixos.lidarr-nfs = {
    services.nfs.server = {
      enable = true;
      exports = ''/mnt/wd_linux/Stuff/Torrents/Music 100.119.80.18(rw,sync,no_subtree_check)'';
    };
    systemd.services.nfs-server.serviceConfig.StateDirectory = "nfs";
  };

  flake.modules.nixos.cocytus-drives.imports = [self.modules.nixos.lidarr-nfs];
}
