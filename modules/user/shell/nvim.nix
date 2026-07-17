{ inputs, ... }:

{

  flake-file.inputs = {
    kickstart-nixvim.url = "github:Stalkingwolf23-glitch/kickstart.nixvim";
    nixvim.url = "github:nix-community/nixvim";
  };

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;
    enableMan = false;
  };
}
