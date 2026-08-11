{
  flake.modules.nixos.keyboard = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        via
      ];

      services.udev.packages = with pkgs; [
        qmk
        qmk-udev-rules
        qmk_hid
        via
      ];
    };
}
