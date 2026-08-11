{ self, ... }:

{
  flake.modules.nixos.settings =
    { pkgs, ... }:
    {
      # Lix for better errors and uhh stuff
      nix.package = pkgs.lixPackageSets.stable.lix;

      nix.optimise.automatic = true;

      nix.settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

      # It is ok to leave this unchanged for compatibility purposes
      system.stateVersion = "26.05";
    };

  flake.modules.nixos.common.imports = [ self.modules.nixos.settings ];
}
