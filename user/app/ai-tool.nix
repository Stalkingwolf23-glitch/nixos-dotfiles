{ pkgs, ... }:

{
  programs.claude-code = {
    enable = true;
    mcpServers = {
      nixos = {
        type = "stdio";
        command = "nix";
        args = [
          "run"
          "github:utensils/mcp-nixos"
          "--"
        ];
      };
    };
  };

  home.packages = [ pkgs.mcp-nixos ];
}
