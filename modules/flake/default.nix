{
  pins = {
    nixpkgs.url = "https://github.com/NixOS/nixpkgs";
    home-manager = {
      url = "https://github.com/nix-community/home-manager";
      follows.nixpkgs = "nixpkgs";
    };
    nix-assets = {
      type = "git";
      url = "ssh://git@github.com/Stalkingwolf23-glitch/nix-assets.git";
      ref = "main";
      follows.nixpkgs = "nixpkgs";
    };
    pnix = {
      url = "https://github.com/bunny-systems/pnix";
      follows.nixpkgs = "nixpkgs";
    };
  };
}
