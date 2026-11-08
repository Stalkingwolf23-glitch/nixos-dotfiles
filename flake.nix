{
  outputs = {self, ...}: let
    inputs = (import ./.pnix {}) // {inherit self;};
    lib = inputs.nixpkgs.lib;
    recursivelyImport = import ./lib/recursivelyImport.nix {inherit lib;};
    flakeEval = import ./lib/flakeEval.nix {inherit lib;};
  in
    flakeEval {
      inherit inputs self;
      modules = recursivelyImport [./modules];
    };
}
