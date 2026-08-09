{
  inputs,
  ...
}:

{
  flake-file.inputs.noctalia.url = "github:noctalia-dev/noctalia/cachix";

  flake.modules.nixos.noctalia = {
    nix.settings.extra-substituters = [ "https://noctalia.cachix.org" ];
    nix.settings.extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  flake.modules.homeManager.noctalia = {
    disabledModules = [ "programs/wayland/noctalia.nix" ];

    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
    };
  };
}
