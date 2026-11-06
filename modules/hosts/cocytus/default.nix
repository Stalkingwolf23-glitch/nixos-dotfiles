{
  self,
  inputs,
  ...
}: let
  cocytus = {
    config,
    pkgs,
    ...
  }: {
    imports = with self.modules.nixos; [
      preservation
      common
      security
      desktop
      compositor
      gaming
      networking

      hardware
      cocytus-secrets
      cocytus-system
      cocytus-disko
      cocytus-drives
      cocytus-hardware-configuration
      copyparty-mount
      hermes-desktop
    ];

    system.stateVersion = "26.05";

    networking = {
      hostName = "cocytus";
      firewall.allowedTCPPorts = [22000];
      firewall.allowedUDPPorts = [22000 21027];
      networkmanager.settings."connection-wol" = {
        match-device = "interface-name:eno1";
        "ethernet.wake-on-lan" = "magic";
      };
    };

    users.users.stalkingwolf = {
      isNormalUser = true;
      # description = "Stalkingwolf";
      hashedPasswordFile = config.security.nix-secrets.secrets.password_hash.path;
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "hermes"
      ];
    };
    nix.settings.trusted-users = ["@wheel"];

    environment.systemPackages = [
      pkgs.home-manager
    ];
  };
in {
  flake.modules.nixos.cocytus = cocytus;
  flake.nixosConfigurations.cocytus = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      cocytus
      inputs.home-manager.nixosModules.default
      {
        home-manager = {
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.stalkingwolf = self.modules.homeManager.cocytus-stalkingwolf;
        };
      }
    ];
  };
}
