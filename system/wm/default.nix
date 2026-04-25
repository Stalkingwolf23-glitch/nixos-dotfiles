{ pkgs, ... }:

{
  imports = [
    ./niri.nix
  ];

  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  programs.dconf = {
    enable = true;
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:escape";
    };
  };

  services.libinput.enable = true;
}
