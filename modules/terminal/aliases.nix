{ self, ... }:

{
  flake.modules.homeManager.aliases = {
    home.shellAliases = {
      ll = "eza --icons --group-directories-first -1";
      ls = "eza --icons  --group-directories-first -1";
      tree = "eza --icons --tree --group-directories-first";
      cat = "bat";
      fetch = "fastfetch --config ~/.config/fastfetch/fetch.jsonc";
      nixos = "z ~/local/nixos";
      oc = "z ~/.config/opencode";
      tack = "z ~/local/nixos && command tack";
      write-tack = "z ~/local/nixos && nix run .#write-tack";
      games = "rgd list | fzf -d $'\t' --with-nth 1 | cut -d$'\t' -f2";
      lil = "steam-run /mnt/wd_linux/Stuff/Misc/.Games/LessonsInLove/LessonsInLove0.51.0.sh";
      df = "duf";
      update = "z ~/local/nixos && git add --intent-to-add . && nh os switch";
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      clean = "nh clean all --keep 5 --optimise";
      export = "noctalia config export >> ~/local/nixos/modules/desktop/noctalia/export.toml";
    };
  };

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.aliases
  ];
}
