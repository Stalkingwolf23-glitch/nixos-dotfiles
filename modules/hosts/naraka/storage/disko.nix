{self, ...}: {
  flake.modules.nixos.naraka-disko = {
    imports = [self.modules.nixos.zfs-disko];
    networking.hostId = "1ea7e932";
  };
}
