{self, ...}: {
  flake.modules.nixos.immich = {
    lib,
    pkgs,
    ...
  }: {
    services.immich = {
      enable = true;
      mediaLocation = "/var/lib/immich";
      host = "127.0.0.1";
      port = 2283;
      accelerationDevices = ["/dev/dri/renderD128"];
    };
    users.users.immich.extraGroups = ["render" "video"];

    services.tailscale.extraUpFlags = ["--advertise-tags=tag:immich"];
    systemd.services = {
      tailscale-immich = {
        wantedBy = ["multi-user.target"];
        wants = [
          "tailscaled.service"
          "immich-server.service"
          "tailscale-navidrome.service"
        ];
        after = [
          "tailscaled.service"
          "tailscaled-autoconnect.service"
          "immich-server.service"
          "tailscale-navidrome.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = lib.escapeShellArgs [
            (lib.getExe pkgs.tailscale)
            "serve"
            "--yes"
            "--bg"
            "--service=svc:immich"
            "--https=443"
            "http://127.0.0.1:2283"
          ];
        };
      };
    };

    systemd.tmpfiles.rules = [
      "A+ /raurava/images - - - - d:u:immich:rx"
    ];

    systemd.tmpfiles.settings.immich."/raurava/images".e = lib.mkForce {
      user = "stalkingwolf";
      group = "users";
      mode = "-";
    };
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.immich];
}
