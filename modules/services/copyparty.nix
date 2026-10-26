{self, ...}: {
  flake.modules.nixos.copyparty = {
    lib,
    pkgs,
    ...
  }: {
    users.users.copyparty = {
      isSystemUser = true;
      group = "copyparty";
    };
    users.groups.copyparty = {};
    systemd.services = {
      copyparty = {
        wantedBy = ["multi-user.target"];
        wants = ["network-online.target"];
        after = ["network-online.target"];
        serviceConfig = {
          User = "copyparty";
          Group = "copyparty";
          Restart = "on-failure";
          RestartSec = "5s";
          ExecStart = lib.escapeShellArgs [
            (lib.getExe pkgs.copyparty)
            "-i"
            "127.0.0.1"
            "-p"
            "3923"
            "-v"
            "/raurava:/raurava:rwmd"
          ];
        };
      };
      tailscale-copyparty = {
        wantedBy = ["multi-user.target"];
        wants = [
          "tailscaled.service"
          "copyparty.service"
          "tailscale-immich.service"
        ];
        after = [
          "tailscaled.service"
          "tailscaled-autoconnect.service"
          "copyparty.service"
          "tailscale-immich.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = lib.escapeShellArgs [
            (lib.getExe pkgs.tailscale)
            "serve"
            "--yes"
            "--bg"
            "--service=svc:copyparty"
            "--https=443"
            "http://127.0.0.1:3923"
          ];
        };
      };
    };
    systemd.tmpfiles.rules = [
      "A+ /raurava/music - - - - u:stalkingwolf:rwX,m::rwX,d:u:stalkingwolf:rwx,d:m::rwx"
      "A+ /raurava/general - - - - u:stalkingwolf:rwX,m::rwX,d:u:stalkingwolf:rwx,d:m::rwx"

      "A+ /raurava/music - - - - u:navidrome:r-X,d:u:navidrome:r-x"
    ];

    services.samba = {
      enable = true;
      openFirewall = false;
      settings = {
        global = {
          "server min protocol" = "SMB3_00";
          "map to guest" = "Never";
        };
        raurava = {
          path = "/raurava";
          "read only" = "no";
          "guest ok" = "no";
          "valid users" = "stalkingwolf";
        };
      };
    };
    networking.firewall.interfaces.tailscale0.allowedTCPPorts = [445];
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.copyparty];

  flake.modules.nixos.copyparty-mount = {config, ...}: {
    fileSystems."/mnt/naraka/raurava" = {
      device = "//naraka/raurava";
      fsType = "cifs";
      options = [
        "_netdev"
        "noauto"
        "x-systemd.automount"
        "vers=3.1.1"
        "credentials=${config.security.nix-secrets.secrets.naraka-smb.path}"
        "uid=stalkingwolf"
        "gid=users"
        "nosuid"
        "nodev"
      ];
    };
  };

  flake.modules.nixos.nasmnt-secrets = {
    security.nix-secrets.secrets = {
      naraka-smb = {
        recipients = ["cocytus"];
        owner = "root";
        mode = "0400";
      };
    };
  };

  flake.modules.nixos.cocytus-secrets.imports = [self.modules.nixos.nasmnt-secrets];
}
