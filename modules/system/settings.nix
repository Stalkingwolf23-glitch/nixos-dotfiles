{self, ...}: {
  flake.modules.nixos.settings = {pkgs, ...}: {
    # Lix for better errors and uhh stuff
    nix.package = pkgs.lixPackageSets.stable.lix;

    nix.optimise.automatic = true;

    nix.settings = {
      warn-dirty = false;
      sandbox = "relaxed";
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    hardware.enableRedistributableFirmware = true;
  };

  flake.modules.nixos.common.imports = [self.modules.nixos.settings];
}
