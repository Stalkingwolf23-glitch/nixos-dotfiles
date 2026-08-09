{ inputs, ... }:

{

  flake-file.inputs = {
    kickstart-nixvim.url = "github:Stalkingwolf23-glitch/kickstart.nixvim";
    nixvim.url = "github:nix-community/nixvim";
  };

  flake.modules.homeManager.editor = { inputs, ... }:
    {
      imports = [
        inputs.kickstart-nixvim.homeManagerModules.default
      ];

      programs.nixvim = {
        enable = true;
        nixpkgs.source = inputs.nixpkgs;
        enableMan = false;
      };
    };
}
