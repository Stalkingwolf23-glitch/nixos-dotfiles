{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     via
  ];
  services.udev = {
    packages = with pkgs; [
      qmk
      qmk-udev-rules # the only relevant
      qmk_hid
      via
    ]; # packages
  }; # udev
}