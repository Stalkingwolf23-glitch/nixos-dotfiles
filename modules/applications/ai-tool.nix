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
}
