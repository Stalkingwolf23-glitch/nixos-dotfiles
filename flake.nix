{
  outputs =
    { self, ... }@args:
    let
      rawInputs = (import ./.tack) { overrides = args.tackOverrides or { }; };
      inputs = rawInputs // {
        inherit self;
      };
    in
    rawInputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
