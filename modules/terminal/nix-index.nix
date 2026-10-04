{
  self,
  inputs,
  ...
}: {
  pins.nix-index-database = {
    url = "https://github.com/nix-community/nix-index-database";
    follows.nixpkgs = "nixpkgs";
  };

  flake.modules.homeManager.nix-index = {
    imports = [inputs.nix-index-database.homeModules.default];

    programs.nix-index-database.comma.enable = true;
  };

  flake.modules.homeManager.terminal.imports = [self.modules.homeManager.nix-index];
}
