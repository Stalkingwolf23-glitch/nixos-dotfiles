{ self, ... }:

{
  flake.modules.nixos.utils =
    { pkgs, ... }:
    {
      services.dbus = {
        enable = true;
        packages = [ pkgs.dconf ];
      };

      environment.systemPackages = with pkgs; [
        xdg-utils
        egl-wayland
        brightnessctl
        catppuccin-papirus-folders
      ];

      programs.dconf.enable = true;

      services.xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
          options = "caps:escape";
        };
      };

      services.libinput.enable = true;

      programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
    };

  flake.modules.nixos.desktop.imports = [ self.modules.nixos.utils ];
}
