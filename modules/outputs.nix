{ inputs, ... }:
let
  systemSettings = {
    system = "x86_64-linux";
    hostname = "cocytus";
    timezone = "Asia/Singapore";
    locale = "en_SG.UTF-8";
  };

  userSettings = {
    username = "stalkingwolf";
    name = "Stalkingwolf";
    email = "stalkingwolf@cocytus.me";
  };

  recursivelyImport = import ./lib/recursivelyImport.nix { lib = inputs.nixpkgs.lib; };

  commonArgs = {
    inherit
      systemSettings
      userSettings
      inputs
      recursivelyImport
      ;
  };
in
{
  flake.nixosConfigurations = {
    cocytus = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = commonArgs;
      modules = [
        ./configuration.nix
        inputs.stylix.nixosModules.stylix
        { nix.settings.warn-dirty = false; }
      ];
    };
  };

  flake.homeConfigurations = {
    stalkingwolf = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${systemSettings.system};
      modules = [
        ./home.nix
        inputs.stylix.homeModules.stylix
        inputs.nix-index-database.homeModules.default
      ];
      extraSpecialArgs = commonArgs;
    };
  };

  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [ inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default ];
      };
    };
}
