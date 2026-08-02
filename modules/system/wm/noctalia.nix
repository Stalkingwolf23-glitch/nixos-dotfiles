{
  systemSettings,
  inputs,
  ...
}:

{
  flake-file.inputs.noctalia.url = "github:noctalia-dev/noctalia/cachix";
  nix.settings.extra-substituters = [ "https://noctalia.cachix.org" ];
  nix.settings.extra-trusted-public-keys = [
    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
  ];

  environment.systemPackages = [
    inputs.noctalia.packages.${systemSettings.system}.default
  ];

  disabledModules = [ "programs/wayland/noctalia.nix" ];

  imports = [
    inputs.noctalia.nixosModules.default
  ];

  programs.noctalia = {
    enable = true;
  };
}
