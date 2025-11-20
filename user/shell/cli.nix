{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
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
