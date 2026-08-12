{ self, ... }:

{
  flake.modules.nixos.cocytus = {
    imports = with self.modules.nixos; [
      cocytus-storage
      cocytus-hardware-configuration
      common
      desktop
      compositor
      gaming
      services

      chaotic
      hardware
      kernel
      keyboard
      performance
      secrets
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
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
      ];
    };

    nix.settings.trusted-users = [ "@wheel" ];
  };
}
