{ self, ... }:

{
  flake.modules.nixos.greeter =
    { pkgs, ... }:
    {
      services.displayManager.noctalia-greeter = {
        enable = true;
        settings = {
          session.default = "hyprland";
          user.default = "stalkingwolf";
          appearance = {
            hide_logo = true;
          };
          output.name = "DP-1";
          cursorTheme = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Classic";
          };

        };
      };

      security.pam.services.greetd.enableGnomeKeyring = true;
    };

  flake.modules.nixos.compositor.imports = [
    self.modules.nixos.greeter
  ];
}
