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
    rich-cli
    jq
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
}
