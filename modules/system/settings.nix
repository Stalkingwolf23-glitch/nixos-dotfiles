{self, ...}: {
  flake.modules.nixos.settings = {pkgs, ...}: {
    # Lix for better errors and uhh stuff
    nix = {
      package = pkgs.lixPackageSets.lix_2_96.lix;

      optimise.automatic = true;

      settings = {
        warn-dirty = false;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };

    hardware.enableRedistributableFirmware = true;
  };

  flake.modules.nixos.common.imports = [self.modules.nixos.settings];
}
