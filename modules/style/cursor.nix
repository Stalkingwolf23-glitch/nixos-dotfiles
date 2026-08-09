{
  flake.modules.homeManager.style = { pkgs, ... }:
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
}
