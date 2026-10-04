{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.cursor = {
    config,
    lib,
    pkgs,
    ...
  }: {
    config = {
      home.pointerCursor = {
        enable = true;
        name = "plana-cursor";
        package = inputs.nix-assets.packages.${pkgs.stdenv.hostPlatform.system}.plana-cursor;
        size = 32;
        gtk = {
          enable = true;
          size = 32;
        };
      };
      wayland.windowManager.hyprland.settings.env = lib.mkIf (config.compositor == "hyprland") [
        {
          _args = ["XCURSOR_THEME" "plana-cursor"];
        }
        {
          _args = ["XCURSOR_SIZE" "32"];
        }
      ];
    };
  };
  flake.modules.homeManager.style.imports = [
    self.modules.homeManager.cursor
  ];
}
