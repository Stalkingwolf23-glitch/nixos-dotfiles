{ inputs, ... }:

{
  flake-file.inputs.aagl.url = "github:ezKEa/aagl-gtk-on-nix";

  imports = [ inputs.aagl.nixosModules.default ];
  nix.settings = inputs.aagl.nixConfig;
  programs.honkers-railway-launcher.enable = true;
  programs.honkers-launcher.enable = true;
}
