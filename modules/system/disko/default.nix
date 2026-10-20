{
  pins.disko = {
    url = "https://github.com/nix-community/disko";
    follows.nixpkgs = "nixpkgs";
  };

  flake.modules.nixos.disko-base = {inputs, ...}: {
    imports = [
      inputs.disko.nixosModules.disko
    ];
    boot.zfs.forceImportRoot = false;
  };
}
