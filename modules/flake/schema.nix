{
  lib,
  self,
  ...
}: {
  options.flake.modules = lib.mkOption {
    type = lib.types.lazyAttrsOf (
      lib.types.lazyAttrsOf lib.types.deferredModule
    );
    default = {};

    apply = lib.mapAttrs (
      class:
        lib.mapAttrs (
          name: module:
            if class == "generic"
            then module
            else
              {...}: {
                _class = class;
                _file = "${self.outPath}#modules.${class}.${name}";
                imports = [module];
              }
        )
    );
  };

  options.flake.nixosConfigurations = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = {};
  };
}
