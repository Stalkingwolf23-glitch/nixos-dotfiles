{ self, ... }:
{
  # Follows nixpkgs hyrpland instead of flake for stability
  flake.modules.nixos.hyprland =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      config = lib.mkIf (config.compositor == "hyprland") {
        nix.settings.extra-substituters = [ "https://hyprland.cachix.org" ];
        nix.settings.extra-trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];

        programs.hyprland.enable = true;

        xdg.portal = {
          config.common.default = [
            "hyprland"
            "gtk"
          ];
        };

        environment = {
          systemPackages = [ pkgs.xwayland-satellite ];
        };
      };
    };

  flake.modules.nixos.compositor.imports = [
    self.modules.nixos.hyprland
  ];

  flake.modules.homeManager.hyprland =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      imports = with self.modules.homeManager; [
        hyprland-keybinds
        hyprland-layouts
        hyprland-appearance
        hyprland-rules
        hyprland-monitors
        hyprland-animations
        hyprland-autostart
        hyprland-hyprsplit
      ];

      config = lib.mkIf (config.compositor == "hyprland") {
        wayland.windowManager.hyprland = {
          enable = true;
          package = null;
          portalPackage = null;
          xwayland.enable = true;
          systemd.enable = true;
          configType = "lua";
          settings = {
            env = [
              {
                _args = [ "QT_STYLE_OVERRIDE" "kvantum" ];
              }
              {
                _args = [ "QT_QPA_PLATFORMTHEME" "qt6ct" ];
              }
              {
                _args = [
                  "QT_PLUGIN_PATH"
                  "${config.home.profileDirectory}/${pkgs.qt5.qtbase.qtPluginPrefix}:${config.home.profileDirectory}/${pkgs.qt6.qtbase.qtPluginPrefix}"
                ];
              }
            ];
            config = [
              {
                _args = [
                  {
                    misc = {
                      force_default_wallpaper = 0;
                      disable_hyprland_logo = true;
                    };
                  }
                ];
              }
            ];
          };
        };
      };

      options.hyprland.workspaceCount = lib.mkOption {
        type = lib.types.ints.positive;
        default = 5;
        description = "Number of workspaces assigned to each monitor by hyprsplit.";
      };

      options.hyprland.hyprLua = lib.mkOption {
        type = lib.types.raw;
        default = lib.generators.mkLuaInline;
        internal = true;
      };
    };

  flake.modules.homeManager.compositor.imports = [
    self.modules.homeManager.hyprland
  ];
}
