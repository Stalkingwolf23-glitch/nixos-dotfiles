{
  outputs = {self, ...}: let
    inputs = (import ./.pnix {}) // {inherit self;};
    recursivelyImport = import ./lib/recursivelyImport.nix {
      lib = inputs.nixpkgs.lib;
    };
  in
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = recursivelyImport [./modules];
    };
}
