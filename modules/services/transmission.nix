{self, ...}: {
  flake.modules.nixos.transmission = {
    services.transmission = {
      enable = true;
      group = "media";
      openRPCPort = true;
      openPeerPorts = true;
      settings = {
        "download-dir" = "/mnt/wd_linux/Stuff/Torrents";
        "incomplete-dir" = "/mnt/wd_linux/Stuff/Torrents/WIP";
        "peer-port" = 51413;
        "rpc-port" = 9091;
        "rpc-bind-address" = "100.111.117.36";
        "rpc-whitelist-enabled" = true;
        "rpc-whitelist" = "127.0.0.1,100.119.80.18";
      };
    };
  };

  flake.modules.nixos.transmission-preservation = {
    preservation.preserveAt."/persist".directories = [
      {
        directory = "/var/lib/transmission";
        user = "transmission";
        group = "media";
        mode = "0750";
      }
    ];
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.transmission-preservation];
}
