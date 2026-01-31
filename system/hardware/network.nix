{ systemSettings, ... }:
{
  networking = {
    hostName = systemSettings.hostname;
    networkmanager = {
      enable = true;
      dns = "none";
    };
    wireless.userControlled = true;

    nameservers = [
      "45.90.28.128"
      "45.90.30.128"
    ];
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3"; # See https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
        cache_file = "/var/lib/dnscrypt-proxy/public-resolvers.md";
      };
      ipv6_servers = true;
      # block_ipv6 = true;

      require_dnssec = true;
      require_nolog = true;
      require_nofilter = false;

      server_names = [ "NextDNS-a33b83" ];
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

  programs.nm-applet = {
    enable = true;
    indicator = true;
  };
}
