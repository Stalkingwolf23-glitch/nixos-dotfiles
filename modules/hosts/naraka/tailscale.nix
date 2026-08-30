{
  flake.modules.nixos.naraka-tailscale =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    lib.mkIf config.services.tailscale.enable {
      systemd.services.tailscale-nitter = {
        wantedBy = [ "multi-user.target" ];
        wants = [ "tailscaled.service" ];
        after = [
          "tailscaled.service"
          "tailscaled-autoconnect.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = lib.escapeShellArgs [
            (lib.getExe pkgs.tailscale)
            "serve"
            "--yes"
            "--bg"
            "--service=svc:nitter"
            "--https=443"
            "http://127.0.0.1:8080"
          ];
        };
      };

      services.tailscale = {
        extraUpFlags = [ "--advertise-tags=tag:nitter" ];
      };
    };
}
