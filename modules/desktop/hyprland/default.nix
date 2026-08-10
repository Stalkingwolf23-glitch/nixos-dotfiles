{ self, ... }:
{
  # Follows nixpkgs hyrpland instead of flake for stability
  flake.modules.nixos.hyprland = { pkgs, ... }: {
    nix.settings.extra-substituters = [ "https://hyprland.cachix.org" ];
    nix.settings.extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];

    programs.hyprland.enable = true;

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = [
        "hyprland"
        "gtk"
      ];
    };
  };

  flake.modules.homeManager.hyprland = { lib, ... }: {
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

    config.wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      xwayland.enable = true;
      systemd.enable = true;
      configType = "lua";
      settings.config = [
        {
          _args = [
            {
              xwayland.force_zero_scaling = true;
              misc = {
                force_default_wallpaper = 0;
                disable_hyprland_logo = true;
              };
            }
          ];
        }
      ];
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
}
