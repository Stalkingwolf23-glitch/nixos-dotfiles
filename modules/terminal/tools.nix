{ self, ... }:

{
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
        btop
      ];
    };

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.tools
  ];
}
