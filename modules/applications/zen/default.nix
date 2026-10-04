{self, ...}: {
  pins.zen-browser = {
    url = "https://github.com/0xc000022070/zen-browser-flake";
    ref = "beta";
    follows = {
      nixpkgs = "nixpkgs";
      home-manager = "home-manager";
    };
  };

  flake.modules.homeManager.zen = {inputs, ...}: {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser.enable = true;
  };

  flake.modules.homeManager.applications.imports = [self.modules.homeManager.zen];

  flake.modules.nixos.zen-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [".config/zen"];
    };
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.zen-preservation];
}
