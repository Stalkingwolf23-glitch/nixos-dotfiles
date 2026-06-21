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

  programs.noctalia = {
    enable = true;
  };
}
