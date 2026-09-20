{self, ...}: {
  flake.modules.nixos.navidrome = {
    lib,
    pkgs,
    ...
  }: {
    services.navidrome = {
      enable = true;
      settings = {
        Address = "127.0.0.1";
        MusicFolder = "/mnt/music";
      };
    };

    fileSystems."/mnt/music" = {
      device = "100.111.117.36:/music";
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

    systemd.services.navidrome = {
      requires = ["mnt-music.mount"];
      after = ["mnt-music.mount"];
    };

    systemd.services.tailscale-navidrome = {
      wantedBy = ["multi-user.target"];
      wants = ["tailscaled.service"];
      after = [
        "tailscaled.service"
        "tailscaled-autoconnect.service"
        "navidrome.service"
      ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = lib.escapeShellArgs [
          (lib.getExe pkgs.tailscale)
          "serve"
          "--yes"
          "--bg"
          "--https=443"
          "http://127.0.0.1:4533"
        ];
      };
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.navidrome];

  # NFS main setup for cocytus is in host/storage/nfs.nix
  flake.modules.nixos.navidrome-nfs = {
    fileSystems."/srv/nfs/music" = {
      device = "/mnt/wd_linux/Stuff/Music";
      fsType = "none";
      options = ["bind"];
    };

    services.nfs.server.exports = ''/srv/nfs/music 100.119.80.18(rw,sync,mountpoint,no_subtree_check)'';
    systemd.services.nfs-server.serviceConfig.StateDirectory = "nfs";
  };

  flake.modules.nixos.cocytus-nfs.imports = [self.modules.nixos.navidrome-nfs];
}
