{ inputs, ... }:

{

  flake-file.inputs = {
    kickstart-nixvim.url = "github:Stalkingwolf23-glitch/kickstart.nixvim";
    nixvim.url = "github:nix-community/nixvim";
  };

  flake.modules.homeManager.editor = { inputs, pkgs, ... }:
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
