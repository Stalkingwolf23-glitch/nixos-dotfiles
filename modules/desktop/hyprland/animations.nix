{ ... }:
{
  flake.modules.homeManager.hyprland-animations =
    { config, lib, ... }:
    let
      hyprLua = config.hyprland.hyprLua;
    in
    {
    wayland.windowManager.hyprland.settings = {
      curve =
        lib.mapAttrsToList
          (name: points: {
            _args = [
              name
              (hyprLua points)
            ];
          })
          {
            md3_decel = ''{ type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } }'';
            md3_accel = ''{ type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } }'';
            hyprnostretch = ''{ type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } }'';
            menu_decel = ''{ type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } }'';
            menu_accel = ''{ type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } }'';
            easeOutExpo = ''{ type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } }'';
            softAcDecel = ''{ type = "bezier", points = { { 0.26, 0.26 }, { 0.15, 1 } } }'';
          };

      animation = [
        {
          _args = [
            {
              leaf = "border";
              enabled = true;
              speed = 6;
              bezier = "default";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "borderangle";
              enabled = true;
              speed = 40;
              bezier = "softAcDecel";
              style = "once";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "windows";
              enabled = true;
              speed = 4;
              bezier = "md3_decel";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "windowsIn";
              enabled = true;
              speed = 4;
              bezier = "md3_decel";
              style = "popin 80%";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "windowsOut";
              enabled = true;
              speed = 3;
              bezier = "md3_accel";
              style = "popin 80%";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "fade";
              enabled = true;
              speed = 4;
              bezier = "md3_decel";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "layersIn";
              enabled = true;
              speed = 4;
              bezier = "menu_decel";
              style = "popin";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "layersOut";
              enabled = true;
              speed = 3;
              bezier = "menu_accel";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "fadeLayersIn";
              enabled = true;
              speed = 2;
              bezier = "menu_decel";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "workspaces";
              enabled = true;
              speed = 4;
              bezier = "easeOutExpo";
              style = "slidefadevert 20%";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "specialWorkspace";
              enabled = true;
              speed = 3;
              bezier = "md3_decel";
              style = "slidefade 15%";
            }
          ];
        }
      ];
    };
    };
}
