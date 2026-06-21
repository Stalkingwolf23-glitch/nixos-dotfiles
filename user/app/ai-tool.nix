{ ... }:

{
  program.claude-code = {
    enable = true;
    settings.mcpServers.nixos = {
      command = "nix";
      args = [
        "run"
        "github:utensils/mcp-nixos"
        "--"
      ];
    };
  };
}
