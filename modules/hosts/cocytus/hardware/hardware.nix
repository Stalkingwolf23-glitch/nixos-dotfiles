{
  flake.modules.nixos.hardware =
    { lib, pkgs, ... }:
    {
      services.journald = {
        rateLimitBurst = 500;
        rateLimitInterval = "30s";
        settings.Journal = {
          SystemMaxUse = "50M";
          SystemMaxFiles = 5;
          RateLimitBurst = 500;
          RateLimitIntervalSec = "30s";
        };
      };

      hardware.bluetooth.enable = true;
      powerManagement.cpuFreqGovernor = "performance";

      services.udev.extraRules =
        let
          mkRule = as: lib.concatStringsSep ", " as;
          mkRules = rs: lib.concatStringsSep "\n" rs;
        in
        mkRules [
          (mkRule [
            ''ACTION=="add|change"''
            ''SUBSYSTEM=="block"''
            ''KERNEL=="sd[a-z]"''
            ''ATTR{queue/rotational}=="1"''
            ''RUN+="${pkgs.hdparm}/bin/hdparm -B 90 -S 41 /dev/%k"''
          ])
        ];

      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      hardware.enableRedistributableFirmware = true;
    };
}
