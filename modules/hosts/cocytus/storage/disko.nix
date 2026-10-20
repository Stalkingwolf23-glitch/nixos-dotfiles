{self, ...}: {
  flake.modules.nixos.cocytus-disko = {
    imports = [
      self.modules.nixos.disko-base
      (import ../../../system/disko/_zfs.nix {persistence = true;})
    ];
    networking.hostId = "8425e349";
  };
}
