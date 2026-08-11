{ self, ... }:

{
  flake.modules.homeManager.desktop.imports = [
    self.modules.homeManager.style
  ];
}
