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
        bat
        moor
      ];
    };

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.tools
  ];

  flake.modules.nixos.tools-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [ ".local/state/lazygit" ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.tools-preservation ];
}
