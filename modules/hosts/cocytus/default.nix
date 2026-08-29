{ self, inputs, ... }:

let
  cocytus = { config, pkgs, ... }: {
    imports = with self.modules.nixos; [
      disko
      preservation
      cocytus-drives
      cocytus-hardware-configuration
      common
      security
      desktop
      compositor
      gaming
      networking

      hardware
      secrets
      cocytus-system
      hermes
    ];

    system.stateVersion = "26.05";

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

    environment.systemPackages = [
      pkgs.home-manager
      inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
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
