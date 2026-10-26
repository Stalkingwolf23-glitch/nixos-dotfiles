{self, ...}: {
  flake.modules.nixos.naraka-disko = {
    imports = [
      self.modules.nixos.disko-base
      (import ../../../system/disko/_zfs.nix {persistence = false;})
      (import ./_pool.nix)
    ];
    networking.hostId = "1ea7e932";
  };
}
