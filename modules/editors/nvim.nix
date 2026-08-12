{
  flake-file.inputs = {
    kickstart-nixvim = {
      url = "github:Stalkingwolf23-glitch/kickstart.nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixvim.follows = "nixvim";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
  };

  flake.modules.homeManager.nvim =
    { inputs, pkgs, ... }:
    {
      imports = [
        inputs.nixvim.homeModules.nixvim
      ];

      programs.nixvim = (import "${inputs.kickstart-nixvim}/nixvim.nix" { inherit pkgs; }) // {
        enable = true;
        nixpkgs.source = inputs.nixpkgs;
        enableMan = false;
      };
    };
}
