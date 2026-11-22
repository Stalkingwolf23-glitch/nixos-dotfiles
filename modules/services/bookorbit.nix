{self, ...}: {
  flake.modules.nixos.bookorbit = { config, ... }: {
    services.bookorbit = {
      enable = true;
      environment = {
        HOST = "127.0.0.1";
        PORT = 3001;
      };
      environmentFile = config.security.nix-secrets.secrets.bookorbit-env.path;
    };

    systemd.services.bookorbit.serviceConfig = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
		services.tailscale.localServe.bookorbit = 3001;
  };

  flake.modules.nixos.services.imports = [self.modules.nixos.bookorbit];

  flake.modules.nixos.bookorbit-secrets = {
    security.nix-secrets.secrets = {
      bookorbit-env.recipients = ["naraka"];
    };
  };

  flake.modules.nixos.naraka-secrets.imports = [self.modules.nixos.bookorbit-secrets];
}