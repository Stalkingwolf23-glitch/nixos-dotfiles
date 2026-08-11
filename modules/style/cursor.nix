{ self, ... }:

{
  flake.modules.homeManager.cursor =
    { pkgs, ... }:
    {
      home.pointerCursor = {
        enable = true;
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
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
