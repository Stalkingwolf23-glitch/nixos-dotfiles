{ self, inputs, ... }:

{
  flake.modules.nixos.naraka = {
    imports = with self.modules.nixos; [
      naraka-hardware
      common
      networking
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
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbqmvqWaw+OqRarYhg4yqeDt2OPcg7Mr2Y0RG+SIHaL stalkingwolf@cocytus"
      ];
    };
    security.sudo.wheelNeedsPassword = false;
  };

  flake.nixosConfigurations.naraka = inputs.nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      self.modules.nixos.naraka
      "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
    ];
  };
}
