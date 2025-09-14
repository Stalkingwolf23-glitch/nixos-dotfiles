{ host, pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
  ];

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
