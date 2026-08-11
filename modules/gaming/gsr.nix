{ self, ... }:

{
  flake.modules.nixos.gsr = {
    programs.gpu-screen-recorder.enable = true;
  };

  flake.modules.nixos.gaming.imports = [ self.modules.nixos.gsr ];
}
