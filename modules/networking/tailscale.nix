{self, ...}: {
  flake.modules.nixos.tailscale = { config, lib, pkgs, ... }:
  let
    backends = config.services.tailscale.localServe;
    url = "tail090b60.ts.net";
  in {
    options.services.tailscale.localServe = lib.mkOption {
      type = lib.types.attrsOf lib.types.port;
      default = {};
      description = "Local HTTP backend ports exposed as Tailscale named services.";
    };

    config = {
      services.tailscale = {
        enable = true;
        extraUpFlags = ["--ssh"];
        serve = lib.mkIf (backends != {}) {
          enable = true;
          configFile = pkgs.writeText "tailscale-serve.json" (builtins.toJSON {
            Services = lib.mapAttrs' (name: port:
              lib.nameValuePair "svc:${name}" {
                TCP."443".HTTPS = true;
                Web."${name}.${url}:443".Handlers."/".Proxy =
                  "http://localhost:${toString port}";
              }
            ) backends;
          });
        };
      };

      boot.kernelModules = ["tun"];
      systemd.services.tailscaled.serviceConfig.ExecStartPre = "${pkgs.kmod}/bin/modprobe tun";
      systemd.services.tailscale-serve = lib.mkIf (backends != {}) {
        serviceConfig = {
          TimeoutStartSec = "120s";
          ExecStartPre =
            "${lib.getExe config.services.tailscale.package} wait --timeout=90s";
        };
      };
    };
  };

  flake.modules.nixos.networking.imports = [self.modules.nixos.tailscale];

  flake.modules.nixos.tailscale-preservation = {
    preservation.preserveAt."/persist".directories = [
      "/var/lib/tailscale"
    ];
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.tailscale-preservation];
}