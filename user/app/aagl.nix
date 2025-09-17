{ pkgs, ... }:

{
  imports = [ aagl.nixosModules.default ];


  programs.anime-game-launcher = {
    enable = true;
    railway-launcher = true;
    anime-game-launcher = false;
    honkers-launcher = false;
  };
}