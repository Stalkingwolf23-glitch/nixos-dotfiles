{self, ...}: {
  flake.modules.nixos.niri = {
    config,
    inputs,
    lib,
    pkgs,
    ...
  }: {
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
          common.default = ["gtk"];
          common."org.freedesktop.impl.portal.ScreenCast" = ["niri"];
        };
      };

      environment.systemPackages = [pkgs.xwayland-satellite];
    };
  };

  flake.modules.nixos.compositor.imports = [self.modules.nixos.niri];

  flake.modules.homeManager.niri = {
    lib,
    config,
    ...
  }: {
    config = lib.mkIf (config.compositor == "niri") {
      wayland.windowManager.niri = {
        enable = true;
        extraConfig = builtins.readFile ./niri/config.kdl;
      };
      xdg.configFile = {
        "niri/animations.kdl".source = ./niri/animations.kdl;
        "niri/outputs.kdl".source = ./niri/outputs.kdl;
        "niri/layouts.kdl".source = ./niri/layouts.kdl;
        "niri/window-rules.kdl".source = ./niri/window-rules.kdl;
        "niri/binds.kdl".source = ./niri/binds.kdl;
        "niri/inputs.kdl".source = ./niri/inputs.kdl;
        "niri/blur.kdl".source = ./niri/blur.kdl;
        "niri/misc.kdl".source = ./niri/misc.kdl;
      };
    };

    flake.modules.homeManager.compositor.imports = [
      self.modules.homeManager.niri
    ];
  };
}
