{
  inputs,
  self,
  ...
}: {
  pins.chaotic = {
    url = "https://github.com/chaotic-cx/nyx";
    ref = "nyxpkgs-unstable";
  };

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
  flake.modules.nixos.cocytus-system.imports = [self.modules.nixos.chaotic];
}
