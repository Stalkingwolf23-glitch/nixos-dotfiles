{
  self,
  inputs,
  user,
  ...
}: {
  flake.modules.nixos.naraka = {
    imports = with self.modules.nixos; [
      common
      self.modules.nixos.user
      networking
      services
      x86-boot
      cachy-cache

      naraka-secrets
      naraka-disko
      naraka-drives
      hermes
      builder
    ];
    system.stateVersion = "26.11";
    networking.hostName = "naraka";
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    users.users.${user} = {
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBgaw6BukZP98yFopZ0pQMOh/JoP/CSBb+X/jwlPFhTt stalkingwolf@cocytus"
      ];
    };
    security.sudo.wheelNeedsPassword = false;
    boot.kernelParams = ["zfs.zfs_arc_max=2147483648"];

    nix.settings = {
      max-jobs = 1;
      cores = 2;
    };
    zramSwap.enable = true;

    systemd.slices."system-lix-daemon".sliceConfig = {
      MemoryHigh = "3G";
      MemoryMax = "4G";
    };
  };

  flake.nixosConfigurations.naraka = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit inputs user;};
    modules = [
      self.modules.nixos.naraka
      {
        home-manager.users.${user} = {
          imports = [self.modules.homeManager.hermes];
          home.stateVersion = "26.11";
        };
      }
    ];
  };
}
