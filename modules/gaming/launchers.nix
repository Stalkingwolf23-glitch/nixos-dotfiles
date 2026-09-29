{self, ...}: {
  flake.modules.nixos.launchers = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      r2mod_cli
      faugus-launcher
    ];
  };

  flake.modules.nixos.gaming.imports = [self.modules.nixos.launchers];

  flake.modules.nixos.launcher-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [
        ".config/r2mod_cli"
        ".local/share/faugus-launcher"
        ".local/config/faugus-launcher"
        ".local/share/umu"
      ];
    };
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.launcher-preservation];
}
