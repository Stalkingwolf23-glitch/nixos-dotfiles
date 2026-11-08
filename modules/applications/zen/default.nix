{self, ...}: {
  pins.zen-browser = {
    url = "https://github.com/0xc000022070/zen-browser-flake";
    ref = "beta";
    follows = {
      nixpkgs = "nixpkgs";
      home-manager = "home-manager";
    };
  };

  pins.firefox-addons = {
    url = "https://gitlab.com/rycee/nur-expressions";
    dir = "pkgs/firefox-addons";
  };
  pins.betterfox = {
    url = "https://github.com/yokoffing/Betterfox";
    flake = false;
  };
  pins.catppuccin-zen-sine = {
    url = "https://github.com/Cole-Abbott/catppuccin-zen-sine";
    flake = false;
  };

  flake.modules.homeManager.zen = {inputs, ...}: {
    imports = [
      inputs.zen-browser.homeModules.beta
      ./_bookmarks.nix
      ./_extensions.nix
      ./_keybinds.nix
      ./_mods.nix
      ./_pins.nix
      ./_search-engine.nix
      ./_settings.nix
      ./_spaces.nix
      ./_userChrome.nix
      ./_userContent.nix
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
