{
  pkgs,
  ...
}:

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
    rmpc
  ];
}
