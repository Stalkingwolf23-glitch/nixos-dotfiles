{
  pkgs,
  ...
}:

{
  flake-file.inputs.rgd = {
    url = "github:Rolv-Apneseth/rgd";
    flake = false;
  };

  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-games
    ];
  };
}
