{ lib, ... }:
{
  options.flake-file.inputs = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        freeformType = lib.types.attrsOf lib.types.anything;
      }
    );
    default = { };
  };
}
