{ self, ... }:

{
  flake.modules.homeManager.aliases = {
    home.shellAliases = {
      cat = "bat";
      nixos = "z ~/local/nixos";
      tack = "z ~/local/nixos && command tack";
      write-tack = "z ~/local/nixos && nix run .#write-tack";
      df = "duf";
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      clean = "nh clean all --keep 5 --optimise";
    };
  };

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.aliases
  ];
}
