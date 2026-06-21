{
  outputs =
    { self, ... }@args:
    let
      rawInputs = (import ./.tack) { overrides = args.tackOverrides or { }; };
      inputs = rawInputs // { inherit self; };
    in
    rawInputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./modules/flake-file.nix
        ./modules/outputs.nix
      ];
    };

  inputs = {
    flake-file.url = "github:denful/flake-file";
    tack.url = "github:manic-systems/tack";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
}
