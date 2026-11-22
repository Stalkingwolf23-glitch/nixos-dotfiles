{self, ...}: {
	flake.modules.nixos.linkwarden = {config, ...}: {
		services.linkwarden = {
			enable = true;
			port = 3002;
			enableRegistration = true;
			environmentFile = config.security.nix-secrets.secrets.linkwarden-env.path;
		};
		services.tailscale.localServe.linkwarden = 3002;
	};

	flake.modules.nixos.services.imports = [self.modules.nixos.linkwarden];

 flake.modules.nixos.linkwarden-secrets = {
    security.nix-secrets.secrets = {
      linkwarden-env.recipients = ["naraka"];
    };
  };

  flake.modules.nixos.naraka-secrets.imports = [self.modules.nixos.linkwarden-secrets];
}