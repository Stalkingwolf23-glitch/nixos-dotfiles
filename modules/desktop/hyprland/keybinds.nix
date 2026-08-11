{ ... }:
{
  flake.modules.homeManager.hyprland-keybinds =
    { lib, ... }:
    {
      options.hyprland.mainMod = lib.mkOption {
        type = lib.types.str;
        default = "SUPER";
        description = "Main modifier for Hyprland keybindings";
      };

      imports = [
        ./keybinds/_apps.nix
        ./keybinds/_windows.nix
        ./keybinds/_workspaces.nix
        ./keybinds/_hyprsplit.nix
      ];
    };
}
