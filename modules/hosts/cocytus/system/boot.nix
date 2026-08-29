{ self, ... }:

{
  flake-file.inputs.lanzaboote = {
    url = "github:nix-community/lanzaboote/v1.1.0";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.boot =
    {
      pkgs,
      lib,
      inputs,
      ...
    }:
    {
      imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
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
      networking.hostId = "8425e349";
      environment.systemPackages = [ pkgs.sbctl ];
    };
  flake.modules.nixos.cocytus-system.imports = [ self.modules.nixos.boot ];
}
