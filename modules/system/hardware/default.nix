{ pkgs, lib, ... }:
{
  services.journald.extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
  services.journald.rateLimitBurst = 500;
  services.journald.rateLimitInterval = "30s";

  hardware.bluetooth.enable = true;

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

  # OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.enableRedistributableFirmware = true;
}
