{ inputs, self, ... }:
let
  recursivelyImport = import ./lib/recursivelyImport.nix { lib = inputs.nixpkgs.lib; };

  commonArgs = {
    inherit inputs recursivelyImport;
  };
in
{
  imports = recursivelyImport [
    ./applications
    ./desktop
    ./editors
    ./gaming
    ./networking
    ./security
    ./style
    ./system
    ./terminal
    ./hosts
  ];

  flake.nixosConfigurations.cocytus = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = commonArgs;
    modules = [
      self.modules.nixos.cocytus
      inputs.home-manager.nixosModules.default
      {
        nix.settings.warn-dirty = false;

        home-manager = {
          useUserPackages = true;
          extraSpecialArgs = commonArgs;
          users.stalkingwolf = self.modules.homeManager.cocytus-stalkingwolf;
        };
      }
    ];
  };

  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [ inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default ];
      };
    };
}
