{ pkgs, systemSettings, ... }:
{
  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
    wireless.userControlled.enable = true;
  };

  programs.nm-applet = {
    enable = true;
    indicator = true;
  };

  services.nextdns = {
    enable = true;
    arguments = [ "-config" "a33b83" "-cache-size" "10MB" ];
  };

  systemd.services.nextdns-activate = {
    script = ''
      /run/current-system/sw/bin/nextdns activate
    '';
    after = [ "nextdns.service" ];
    wantedBy = [ "multi-user.target" ];
  };
}