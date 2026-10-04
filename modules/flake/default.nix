{inputs, ...}: {
  imports = [
    inputs.flake-file.flakeModules.dendritic
  ];
  systems = ["x86_64-linux"];

  pins = {
    flake-file.url = "https://github.com/denful/flake-file";
    flake-parts.url = "https://github.com/hercules-ci/flake-parts";
    nixpkgs.url = "https://github.com/NixOS/nixpkgs";
    home-manager = {
      url = "https://github.com/nix-community/home-manager";
      follows.nixpkgs = "nixpkgs";
    };
    nix-assets = {
      type = "git";
      url = "ssh://git@github.com/Stalkingwolf23-glitch/nix-assets.git";
      ref = "main";
      follows.nixpkgs = "nixpkgs";
    };
    pnix = {
      url = "https://github.com/bunny-systems/pnix";
      follows.nixpkgs = "nixpkgs";
    };
  };

  perSystem = {system, ...}: {
    _module.args.pkgs = inputs.nixpkgs.legacyPackages.${system};
  };
}
