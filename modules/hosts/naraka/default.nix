{ self, inputs, ... }:

{
  flake.modules.nixos.naraka = {
    imports = with self.modules.nixos; [
      naraka-hardware
      common
      networking
      services

      naraka-tailscale
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
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBgaw6BukZP98yFopZ0pQMOh/JoP/CSBb+X/jwlPFhTt stalkingwolf@cocytus"
      ];
    };
    security.sudo.wheelNeedsPassword = false;

    nix.settings.extra-substituters = [ "https://stalkingwolf.cachix.org" ];
    nix.settings.extra-trusted-public-keys = [
      "stalkingwolf.cachix.org-1:eW5wFsNkhO/Doa6QEXPmWjK9c8kbKBlU0fg3+RXIOR4="
    ];
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
