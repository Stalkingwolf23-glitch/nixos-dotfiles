{
  self,
  inputs,
  ...
}: {
  pins.umbriel = {
    url = "https://github.com/noctalia-dev/umbriel";
    ref = "cachix";
  };

  flake.modules.nixos.umbriel = {
    lib,
    config,
    pkgs,
    ...
  }: {
    imports = [inputs.umbriel.nixosModules.default];

    config = lib.mkIf (config.compositor == "umbriel") {
      nix.settings.extra-substituters = ["https://umbriel.cachix.org"];
      nix.settings.extra-trusted-public-keys = [
        "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
      ];

      programs.umbriel = {
        enable = true;
        portalPackage = pkgs.xdg-desktop-portal-umbriel;
      };

      xdg.portal = {
        config.umbriel.default = [
          "umbriel"
          "gtk"
        ];
      };
    };
  };

  flake.modules.nixos.compositor.imports = [self.modules.nixos.umbriel];

  flake.modules.homeManager.umbriel = {
    lib,
    config,
    ...
  }: {
    imports = [
      inputs.umbriel.homeModules.default
      ./_input.nix
      ./_animations.nix
      ./_autostart.nix
      ./_layout.nix
      ./_output.nix
      ./_rules.nix
    ];

    config = lib.mkIf (config.compositor == "umbriel") {
      programs.umbriel = {
        enable = true;
        settings.general = {
          xwayland = true;
          show_cheatsheet = false;
          focus_on_activate = false;
          honor_restored_maximize = true;
        };
      };
    };
  };

  flake.modules.homeManager.compositor.imports = [self.modules.homeManager.umbriel];
}
