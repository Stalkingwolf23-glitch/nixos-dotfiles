{
  inputs,
  self,
  ...
}:

{
  flake-file.inputs.noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";

  flake.modules.nixos.greeter =
    { pkgs, ... }:
    {
      imports = [ inputs.noctalia-greeter.nixosModules.default ];

      programs.noctalia-greeter = {
        enable = true;
        settings = {
          cursor = {
            theme = "Bibata-Modern-Classic";
            size = 24;
            path = "${pkgs.bibata-cursors}/share/icons";
          };
          session.default = "hyprland";
          user.default = "stalkingwolf";
          appearance = {
            hide_logo = true;
          };
          output.name = "DP-1";
        };
      };

      security.pam.services.greetd.enableGnomeKeyring = true;
    };

  flake.modules.nixos.compositor.imports = [
    self.modules.nixos.greeter
  ];
}
