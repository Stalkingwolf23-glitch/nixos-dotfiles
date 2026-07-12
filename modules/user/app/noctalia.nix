{
  pkgs,
  inputs,
  ...
}:

{
  flake-file.inputs.noctalia.url = "github:noctalia-dev/noctalia/cachix";

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
