{ lib, ... }:
{
  options.flake-file.inputs = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        freeformType = lib.types.attrsOf lib.types.anything;
      }
    );
    default = { };
    description = ''
      Flake inputs declared next to the config that consumes them.
      Harvested by modules/flake-file.nix into the real flake input list.
      Inert here — this module tree does not act on it.

      Authored by Claude Code
    '';
  };
}
