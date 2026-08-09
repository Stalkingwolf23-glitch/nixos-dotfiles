{
  flake-file.inputs.nix-index-database.url = "github:nix-community/nix-index-database";

  flake.modules.homeManager.terminal =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        git
        gallery-dl
        cava
        zip
        unzip
        rsync
        fastfetch
        ripgrep
        starship
        megatools
        eza
        trash-cli
        scrcpy
        btop
        unrar
        rich-cli
        jq
        playerctl
        duf
        nix-search-tv
        lazygit
        smartmontools
        evtest
      ];

      programs.nix-index-database.comma.enable = true;
      programs.btop.enable = true;
    };
}
