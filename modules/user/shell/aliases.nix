{ ... }:

{
  home.shellAliases = {
    ll = "eza --icons --group-directories-first -1";
    ls = "eza --icons  --group-directories-first -1";
    tree = "eza --icons --tree --group-directories-first";
    fetch = "fastfetch --config ~/.config/fastfetch/fetch.jsonc";
    ".." = "z ..";
    nixos = "z ~/local/nixos";
    tack = "z ~/local/nixos && command tack";
    games = "rgd list | fzf -d $'\t' --with-nth 1 | cut -d$'\t' -f2";
    lil = "steam-run /mnt/wd_linux/Stuff/Misc/.Games/LessonsInLove/LessonsInLove0.51.0.sh";
    df = "duf";
  };
}
