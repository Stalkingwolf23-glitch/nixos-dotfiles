{self, ...}: {
  pins = {
    lanzaboote = {
      url = "https://github.com/nix-community/lanzaboote";
      ref = "v1.1.0";
      follows.nixpkgs = "nixpkgs";
    };
    bootvine = {
      url = "https://codeberg.org/wvhulle/bootvine";
      follows.nixpkgs = "nixpkgs";
    };
  };

  flake.modules.nixos.boot = {
    pkgs,
    lib,
    inputs,
    ...
  }: {
    imports = [
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.bootvine.nixosModules.default
    ];
    boot = {
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };

      loader = {
        systemd-boot = {
          enable = lib.mkForce false;
          editor = false;
          configurationLimit = 10;
          consoleMode = "max";
        };

        efi.canTouchEfiVariables = true;
        efi.efiSysMountPoint = "/boot";
        timeout = 5;
      };
    };
    environment.systemPackages = [pkgs.sbctl];
    services.bootvine.enable = true;
  };
  flake.modules.nixos.cocytus-system.imports = [self.modules.nixos.boot];
}
