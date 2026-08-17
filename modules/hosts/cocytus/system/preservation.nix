{
  flake.modules.nixos.preservation =
    { config, inputs, ... }:
    {
      imports = [ inputs.preservation.nixosModules.preservation ];

      boot.initrd.systemd = {
        enable = true;
        tpm2.enable = true;
      };
      preservation.enable = true;

      fileSystems."/nix".neededForBoot = true;
      fileSystems."/persist".neededForBoot = true;

      boot.initrd.systemd.services.zfs-root-rollback = {
        description = "Rollback for impermanence";
        wantedBy = [ "initrd-root-fs.target" ];
        before = [ "initrd-root-fs.target" ];
        after = [ "zfs-import-rpool.service" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${config.boot.zfs.package}/sbin/zfs rollback rpool/local/root@blank";
        };
      };

      preservation.preserveAt."/persist" = {
        directories = [
          {
            directory = "/etc/nixos";
            user = "root";
            group = "root";
            mode = "0755";
          }
          {
            directory = "/etc/NetworkManager/system-connections";
            user = "root";
            group = "root";
            mode = "0700";
          }
          {
            directory = "/var/lib/nixos";
            user = "root";
            group = "root";
            mode = "0755";
          }
          {
            directory = "/var/lib/NetworkManager";
            user = "root";
            group = "root";
            mode = "0700";
          }
          {
            directory = "/var/lib/sbctl";
            user = "root";
            group = "root";
            mode = "0700";
          }
          {
            directory = "/var/lib/bluetooth";
            user = "root";
            group = "root";
            mode = "0755";
          }
          {
            directory = "/var/log/audit";
            user = "root";
            group = "root";
            mode = "0700";
          }
          {
            directory = "/var/log/journal";
            user = "root";
            group = "root";
            mode = "2755";
          }
        ];

        files = [
          {
            file = "/etc/machine-id";
            user = "root";
            group = "root";
            mode = "0644";
            inInitrd = true;
          }
          {
            file = "/var/lib/systemd/random-seed";
            user = "root";
            group = "root";
            mode = "0600";
          }
        ];
      };
    };
}
