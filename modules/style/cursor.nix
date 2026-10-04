{self, ...}: {
  flake.modules.homeManager.cursor = {
    pkgs,
    inputs,
    ...
  }: {
    home.pointerCursor = {
      enable = true;
      name = "plana-cursor";
      package = inputs.nix-assets.packages.${pkgs.system}.plana-cursor;
      size = 32;

      gtk = {
        enable = true;
        size = 32;
      };
    };
  };

  flake.modules.homeManager.style.imports = [
    self.modules.homeManager.cursor
  ];
}
