{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.naraka = {
    imports = with self.modules.nixos; [
      common
      networking
      services
      x86-boot
      cachy-cache

      naraka-secrets
      naraka-disko
      naraka-drives
      hermes
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

    users.users.stalkingwolf = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBgaw6BukZP98yFopZ0pQMOh/JoP/CSBb+X/jwlPFhTt stalkingwolf@cocytus"
      ];
    };
    security.sudo.wheelNeedsPassword = false;
    boot.kernelParams = ["zfs.zfs_arc_max=2147483648"];

    nix.settings = {
      max-jobs = 1;
      cores = 4;
    };
  };

  flake.nixosConfigurations.naraka = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit inputs;};
    modules = [
      self.modules.nixos.naraka
      inputs.home-manager.nixosModules.default
      {
        home-manager = {
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.stalkingwolf = {
            imports = with self.modules.homeManager; [terminal hermes];
            home.username = "stalkingwolf";
            home.homeDirectory = "/home/stalkingwolf";
            home.stateVersion = "26.11";
          };
        };
      }
    ];
  };
}
