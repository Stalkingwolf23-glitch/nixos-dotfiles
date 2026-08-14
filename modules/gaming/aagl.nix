{ inputs, self, ... }:

{
  flake-file.inputs.aagl.url = "github:ezKEa/aagl-gtk-on-nix";

  flake.modules.nixos.aagl =
    { lib, ... }:
    {
      imports = [ inputs.aagl.nixosModules.default ];
      nix.settings = lib.mkMerge [
        inputs.aagl.nixConfig
        {
          extra-substituters = [ "https://ezkea.cachix.org" ];
          extra-trusted-public-keys = [
            "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
          ];
        }
      ];
      programs.honkers-railway-launcher.enable = true;
    };

  flake.modules.nixos.gaming.imports = [ self.modules.nixos.aagl ];
}
