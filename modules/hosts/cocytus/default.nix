{
  self,
  inputs,
  user,
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
      self.modules.nixos.user

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
      interfaces.eno1.wakeOnLan.enable = true;
    };

    users.users.${user} = {
      hashedPasswordFile = config.security.nix-secrets.secrets.password_hash.path;
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "hermes"
      ];
    };
    nix.settings.trusted-users = ["@wheel"];

    environment.systemPackages = [pkgs.home-manager];
  };
in {
  flake.modules.nixos.cocytus = cocytus;
  flake.nixosConfigurations.cocytus = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs user;};
    modules = [
      cocytus
      {
        home-manager = {
          users.${user} = self.modules.homeManager.cocytus-user;
        };
      }
    ];
  };
}
