{
  pkgs,
  inputs,
  config,
  userSettings,
  ...
}:

let
  directory = "${config.users.users.${userSettings.username}.home}/Pictures/Wallpapers";

in
{
  home.packages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];

  imports = [
    inputs.noctalia.nixosModules.default
  ];

  services.noctalia-shell.enable = true;

  home-manager.users.${userSettings.username} = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;

      colors = {
        mError = "#f38ba8";
        mOError = "#11111b";
        mOnPrimary = "#11111b";
        mOnSecondary = "#11111b";
        mOnSurface = "#cdd6f4";
        mOnSurfaceVariant = "#a3b4eb";
        mOnTertiary = "#11111b";
        mOutline = "#4c4f69";
        mPrimary = "#89b4fa";
        mSecondary = "#b4befe";
        mShadow = "#11111b";
        mSurface = "#1e1e2e";
        mSurfaceVariant = "#313244";
        mTertiary = "#94e2d5";
      };
    };
  };
}
