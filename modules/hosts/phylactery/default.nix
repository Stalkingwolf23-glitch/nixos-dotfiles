{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.phylactery = {
    imports = [
      self.modules.nixos.phylactery-installer
      "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
    ];
    networking.networkmanager.enable = true;
    services.openssh.enable = true;
  };

  flake.nixosConfigurations.phylactery = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit inputs;};
    modules = [
      self.modules.nixos.phylactery
    ];
  };
}
