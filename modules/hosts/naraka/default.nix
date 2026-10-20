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

      naraka-tailscale
      naraka-secrets
      naraka-disko
      naraka-hardware
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

    nix.settings.extra-substituters = ["https://stalkingwolf.cachix.org"];
    nix.settings.extra-trusted-public-keys = [
      "stalkingwolf.cachix.org-1:eW5wFsNkhO/Doa6QEXPmWjK9c8kbKBlU0fg3+RXIOR4="
    ];
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
            imports = [self.modules.homeManager.terminal];
            home.username = "stalkingwolf";
            home.homeDirectory = "/home/stalkingwolf";
            home.stateVersion = "26.11";
          };
        };
      }
    ];
  };
}
