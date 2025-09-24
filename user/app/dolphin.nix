{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kio-fuse #to mount remote filesystems via FUSE
    kdePackages.kio-extras #extra protocols support (sftp, fish and more)
    kdePackages.qtsvg # svg icon support
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.qtstyleplugin-kvantum
    kdePackages.ark
    #kdePackages.breeze-icons
    libsForQt5.kservice
    kdePackages.qt6ct
    icoutils
    # (catppuccin-kvantum.override {
    #   variant = "mocha";
    #   accent = "blue";
    # })
  ];
}