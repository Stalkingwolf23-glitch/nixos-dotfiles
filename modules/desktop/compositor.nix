{ self, ... }:

{
  flake.modules.nixos.compositor =
    { lib, ... }:
    {
      options.compositor = lib.mkOption {
        type = lib.types.enum [
          "hyprland"
          "niri"
        ];
        default = "hyprland";
        description = "The compositor to enable.";
      };

    };

  flake.modules.homeManager.compositor =
    { lib, ... }:
    {
      options.compositor = lib.mkOption {
        type = lib.types.enum [
          "hyprland"
          "niri"
        ];
        default = "hyprland";
        description = "The compositor to configure.";
      };

    };
}
