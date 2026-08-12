{ self, ... }:

{
  flake.modules.nixos.portal = { pkgs, ... }: {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  flake.modules.nixos.compositor.imports = [ self.modules.nixos.portal ];
}
