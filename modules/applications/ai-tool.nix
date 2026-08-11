{ self, ... }:

{
  flake.modules.homeManager.aiTool = { pkgs, ... }:
    {
    home.packages = with pkgs; [
      mcp-nixos
      nixd
      opencode
      nixfmt
    ];
    };

  flake.modules.homeManager.applications.imports = [
    self.modules.homeManager.aiTool
  ];
}
