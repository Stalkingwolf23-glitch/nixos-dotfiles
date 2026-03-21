{ pkgs, lib, ... }:
{
  imports = [
    ./kernel.nix
    ./network.nix
    ./nvidia.nix
    ./time.nix
  ];

  services.earlyoom.enable = true;
  services.earlyoom.freeSwapThreshold = 2;
  services.earlyoom.freeMemThreshold = 2;
  zramSwap.enable = true;

  services.journald.extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
  services.journald.rateLimitBurst = 500;
  services.journald.rateLimitInterval = "30s";

  hardware.bluetooth.enable = false;
  services.blueman.enable = false;

  powerManagement.cpuFreqGovernor = "performance";

  services.udev.extraRules =
    let
      mkRule = as: lib.concatStringsSep ", " as;
      mkRules = rs: lib.concatStringsSep "\n" rs;
    in
    mkRules ([
      (mkRule [
        ''ACTION=="add|change"''
        ''SUBSYSTEM=="block"''
        ''KERNEL=="sd[a-z]"''
        ''ATTR{queue/rotational}=="1"''
        ''RUN+="${pkgs.hdparm}/bin/hdparm -B 90 -S 41 /dev/%k"''
      ])
    ]);
}
