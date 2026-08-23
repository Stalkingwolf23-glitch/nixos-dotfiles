{ self, inputs, ... }:

let
  cocytus = { config, ... }: {
    imports = with self.modules.nixos; [
      disko
      preservation
      cocytus-drives
      cocytus-hardware-configuration
      common
      desktop
      compositor
      gaming
      services

      hardware
      secrets
      cocytus-system
      hermes
    ];

    networking.hostName = "cocytus";

    networking.firewall.allowedTCPPorts = [ 22000 ];
    networking.firewall.allowedUDPPorts = [
      22000
      21027
    ];
    users.users.stalkingwolf = {
      isNormalUser = true;
      # description = "Stalkingwolf";
      hashedPasswordFile = config.sops.secrets.password_hash.path;
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "hermes"
      ];
    };
    nix.settings.trusted-users = [ "@wheel" ];
  };
in
{
  flake.modules.nixos.cocytus = cocytus;
  flake.nixosConfigurations.cocytus = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      cocytus
      inputs.home-manager.nixosModules.default
      {
        home-manager = {
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.stalkingwolf = self.modules.homeManager.cocytus-stalkingwolf;
        };
      }
    ];
  };
}
