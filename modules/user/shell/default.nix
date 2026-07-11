{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.kickstart-nixvim.homeManagerModules.default
  ];

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
    rmpc
    rich-cli
    jq
    playerctl
    duf
  ];

  programs.gallery-dl = {
    enable = true;
    settings = {
      base-directory = "~/local/gallery-dl/";
    };
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;
  };

  programs.nix-index-database.comma.enable = true;
}
