{self, ...}: {
  flake.modules.nixos.lidarr = {
    services.lidarr = {
      enable = true;
      group = "media";
    };

    fileSystems."/mnt/lidarr" = {
      device = "100.111.117.36:/lidarr";
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

  flake.modules.nixos.services.imports = [self.modules.nixos.lidarr];

  # NFS main setup for cocytus is in host/storage/nfs.nix
  flake.modules.nixos.lidarr-nfs = {
    fileSystems."/srv/nfs/lidarr" = {
      device = "/mnt/wd_linux/Stuff/Torrents/Lidarr";
      fsType = "none";
      options = ["bind"];
    };

    services.nfs.server.exports = ''/srv/nfs/lidarr 100.119.80.18(rw,sync,mountpoint,no_subtree_check)'';
    systemd.services.nfs-server.serviceConfig.StateDirectory = "nfs";
  };

  flake.modules.nixos.cocytus-nfs.imports = [self.modules.nixos.lidarr-nfs];
}
