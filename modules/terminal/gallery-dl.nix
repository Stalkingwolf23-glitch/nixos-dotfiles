{ inputs, ... }:

{
  flake-file.inputs.gallery-dl = {
    url = "git+https://codeberg.org/mikf/gallery-dl";
    flake = false;
  };

  flake.modules.homeManager.terminal = { inputs, ... }:
    {
      nixpkgs.overlays = [
        (import ../overlays/gallery-dl.nix inputs)
      ];

      programs.gallery-dl = {
        enable = true;
        settings = {
          base-directory = "~/local/gallery-dl/";
        };
      };
    };
}
