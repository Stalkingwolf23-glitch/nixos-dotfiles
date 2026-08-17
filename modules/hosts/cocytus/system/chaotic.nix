{ inputs, self, ... }:

{
  flake-file.inputs.chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

  flake.modules.nixos.chaotic = {
    nixpkgs.overlays = [
      inputs.chaotic.overlays.default
    ];

    imports = with inputs.chaotic.nixosModules; [
      nyx-cache
      nyx-overlay
      nyx-registry
    ];

    nixpkgs.config.allowUnfree = true;
  };
  flake.modules.nixos.cocytus-system.imports = [ self.modules.nixos.chaotic ];
}
