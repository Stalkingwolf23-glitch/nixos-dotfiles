{ self, ... }:
{
  flake-file.inputs = {
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  flake.modules.homeManager.zen =
    { inputs, ... }:
    {
      imports = [
        inputs.zen-browser.homeModules.beta
      ];

      programs.zen-browser.enable = true;
    };

  flake.modules.homeManager.applications.imports = [
    self.modules.homeManager.zen
  ];
}
