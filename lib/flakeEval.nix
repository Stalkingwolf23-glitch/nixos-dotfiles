{lib}: {
  inputs,
  self,
  modules,
}:
(lib.evalModules {
  specialArgs = {
    inherit inputs self;
  };
  modules = modules;
})
.config.flake
