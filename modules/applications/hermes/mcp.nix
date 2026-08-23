{
  flake.modules.nixos.hermes = { lib, ... }: {
    services.hermes-agent.mcpServers = {
      nixos = {
        command = "nix";
        args = [
          "run"
          "github:utensils/mcp-nixos"
          "--"
        ];
      };
    };
  };
}
