{self, ...}: {
  flake.modules.nixos.portal = {pkgs, ...}: {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-termfilechooser];
      config.common."org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
    };
    environment.etc."xdg/xdg-desktop-portal-termfilechooser/config".text = ''
      [filechooser]
      cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
      default_dir=$HOME/downloads
      create_help_file=1
      env=TERMCMD='kitty --tile filechooser'
      env=PATH="$PATH:/run/current-system/sw/bin"
      open_mode=suggested
      save_mode=last
    '';
  };

  flake.modules.nixos.compositor.imports = [self.modules.nixos.portal];
}
