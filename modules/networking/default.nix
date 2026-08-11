{ self, ... }:

{
  flake.modules.nixos.networking = { pkgs, ... }: {
    networking = {
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
        ipv6_servers = true;
        require_dnssec = true;
        require_nolog = true;
        require_nofilter = false;

        static."NextDNS-a33b83".stamp = "sdns://AgEAAAAAAAAAAAAOZG5zLm5leHRkbnMuaW8HL2EzM2I4Mw";
        server_names = [ "NextDNS-a33b83" ];
      };
    };

    systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory = "dnscrypt-proxy";

    environment.systemPackages = [
      pkgs.nextdns
      pkgs.wpa_supplicant
    ];
  };

  flake.modules.nixos.services.imports = [ self.modules.nixos.networking ];
}
