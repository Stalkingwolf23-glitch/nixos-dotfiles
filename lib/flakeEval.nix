{lib}: {
  inputs,
  self,
  modules,
  user,
}:
(lib.evalModules {
  specialArgs = {
    inherit inputs self user;
  };
  modules = modules;
})
.config.flake
