{self, ...}: {
  flake.modules.nixos.launchers = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      r2modman
      faugus-launcher
    ];
  };

  flake.modules.nixos.gaming.imports = [self.modules.nixos.launchers];

  flake.modules.nixos.launcher-preservation = {user, ...}: {
    preservation.preserveAt."/persist".users.${user} = {
      directories = [
        ".config/r2modman"
        ".config/r2modmanPlus-local"
        ".local/share/faugus-launcher"
        ".local/config/faugus-launcher"
        ".local/share/umu"
      ];
    };
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.launcher-preservation];
}
