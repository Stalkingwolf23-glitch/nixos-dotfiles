{self, ...}: {
  flake.modules.nixos.groups = {
    users.groups.media.gid = 1001;
  };

  flake.modules.nixos.common.imports = [self.modules.nixos.groups];
}
