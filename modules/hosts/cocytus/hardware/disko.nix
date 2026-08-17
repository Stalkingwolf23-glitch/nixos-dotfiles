{
  flake-file.inputs.disko = {
    url = "github:nix-community/disko";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.disko = { inputs, ... }: {
    imports = [ inputs.disko.nixosModules.disko ];

    networking.hostId = "8425e349";
    boot.zfs.forceImportRoot = false;

    disko.devices = {
      disk.main = {
        device = "/dev/disk/by-id/nvme-CT250P2SSD8_2150E5F0B63E_1";
        type = "disk";

        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00"; # EFI
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            cryptroot = {
              size = "100%";
              content = {
                type = "luks";
                name = "cryptroot";
                settings.allowDiscards = true;

                content = {
                  type = "zfs";
                  pool = "rpool";
                };
              };
            };
          };
        };
      };
      zpool.rpool = {
        type = "zpool";
        options = {
          autotrim = "on";
        };
        rootFsOptions = {
          compression = "zstd";
          atime = "off";
          xattr = "sa";
          acltype = "posixacl";
        };

        datasets = {
          "local/root" = {
            type = "zfs_fs";
            mountpoint = "/";
          };

          "local/nix" = {
            type = "zfs_fs";
            mountpoint = "/nix";
          };

          "local/home" = {
            type = "zfs_fs";
            mountpoint = "/home";
          };

          "safe/persist" = {
            type = "zfs_fs";
            mountpoint = "/persist";
          };
        };
      };
    };
  };
}
