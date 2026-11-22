{self, ...}: {
  flake.modules.nixos.navidrome =  {
  	imports = [self.modules.nixos.spindle];

    services.navidrome = {
      enable = true;
      withPlugins = p: [
        p.discord-rich-presence
      ];
      settings = {
        Address = "127.0.0.1";
        Port = 4533;
        MusicFolder = "/raurava/music";
      };
    };

    services.tailscale.extraUpFlags = ["--advertise-tags=tag:navidrome"];
    systemd.services.navidrome.serviceConfig = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
    services.tailscale.localServe.navidrome = 4533;
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.navidrome];
}
