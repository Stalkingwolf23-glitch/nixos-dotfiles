{self, ...}: {
  flake.modules.nixos.navidrome = {
    lib,
    pkgs,
    ...
  }: {
    services.navidrome = {
      enable = true;
      settings = {
        Address = "127.0.0.1";
        MusicFolder = "/mnt/music";
      };
    };

    systemd.services.tailscale-navidrome = {
      wantedBy = ["multi-user.target"];
      wants = ["tailscaled.service"];
      after = [
        "tailscaled.service"
        "tailscaled-autoconnect.service"
        "navidrome.service"
      ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = lib.escapeShellArgs [
          (lib.getExe pkgs.tailscale)
          "serve"
          "--yes"
          "--bg"
          "--https=443"
          "http://127.0.0.1:4533"
        ];
      };
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.navidrome];
}
