{lib, ...}: {
  options.pins = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = {};
    internal = true;
  };
}
