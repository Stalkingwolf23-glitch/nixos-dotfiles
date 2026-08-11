{ self, ... }:

{
  flake.modules.homeManager.fonts = { config, lib, pkgs, ... }:
    {
    home.packages = [ pkgs.maple-mono.NF-CN-unhinted ];
    fonts = {
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "Maple Mono NF CN" ];
          sansSerif = [ "Maple Mono NF CN" ];
          monospace = [ "Maple Mono NF CN" ];
        };
      };
    };

    gtk.font = lib.mkIf config.gtk.enable {
      name = "Maple Mono NF CN";
    };
    };

  flake.modules.homeManager.style.imports = [
    self.modules.homeManager.fonts
  ];
}
