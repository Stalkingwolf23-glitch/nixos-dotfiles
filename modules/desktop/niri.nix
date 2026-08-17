{ self, ... }:

{
  flake.modules.nixos.niri =
    {
      config,
      inputs,
      lib,
      pkgs,
      ...
    }:
    {
      config = lib.mkIf (config.compositor == "niri") {
        programs.niri = {
          enable = true;
        };

        xdg.portal = {
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            inputs.niri-screenshare.packages.${pkgs.stdenv.hostPlatform.system}.default
          ];
          config = {
            common.default = [ "gtk" ];
            common."org.freedesktop.impl.portal.ScreenCast" = [ "niri" ];
          };
        };

        environment.systemPackages = [ pkgs.xwayland-satellite ];
      };
    };

  flake.modules.nixos.compositor.imports = [ self.modules.nixos.niri ];

  flake.modules.homeManager.niri =
    { config, lib, ... }:
    {
      config = lib.mkIf (config.compositor == "niri") {
        home.file.".config/niri".source =
          config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/local/nixos/modules/assets/config/niri";
      };
    };

  flake.modules.homeManager.compositor.imports = [
    self.modules.homeManager.niri
  ];
}
