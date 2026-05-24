{
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
  ];

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
      mOnHover = "#11111b";
      mHover = "#89b4fa";
      mOutline = "#313244";
      mPrimary = "#89b4fa";
      mSecondary = "#b4befe";
      mShadow = "#11111b";
      mSurface = "#1e1e2e";
      mSurfaceVariant = "#181825";
      mTertiary = "#94e2d5";
    };
  };
}
