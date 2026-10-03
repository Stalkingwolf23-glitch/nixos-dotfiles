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
      size = 24;

      gtk = {
        enable = true;
        size = 24;
      };
    };
  };

  flake.modules.homeManager.style.imports = [
    self.modules.homeManager.cursor
  ];
}
