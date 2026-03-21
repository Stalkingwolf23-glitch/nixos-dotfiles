{
  pkgs,
  ...
}:

{
  imports = [
    ./btop.nix
    ./git.nix
    ./mpd.nix
    ./nh.nix
    ./sh.nix
    ./starship.nix
    ./term.nix
    ./yazi.nix
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
}
