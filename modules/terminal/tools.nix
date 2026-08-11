{ self, ... }:

{
  flake-file.inputs.nix-index-database.url = "github:nix-community/nix-index-database";

  flake.modules.homeManager.tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        gallery-dl
        cava
        zip
        unzip
        rsync
        ripgrep
        megatools
        eza
        trash-cli
        scrcpy
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

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.tools
  ];
}
