{ systemSettings, ... }:
{
  networking = {
    hostName = systemSettings.hostname;
    networkmanager = {
      enable = true;
      dns = "none";
    };
    wireless.userControlled.enable = true;
  };

  programs.nm-applet = {
    enable = true;
    indicator = true;
  };

  services.nextdns = {
    enable = true;
    arguments = [
      "-config"
      "a33b83"
      "-cache-size"
      "10MB"
      "-auto-activate"
    ];
  };

  systemd.services.nextdns = {
    serviceConfig = {
      ExecStartPre = "/run/current-system/sw/bin/sleep 5";
    };
    after = [
      "network-online.target"
      "NetworkManager-wait-online.service"
    ];
    wants = [ "network-online.target" ];
    restartIfChanged = false;
  };

  services.resolved.enable = false;
}
