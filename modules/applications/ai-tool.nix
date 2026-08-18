{ self, ... }:

{
  flake.modules.homeManager.aiTool =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mcp-nixos
        nixd
        opencode
        nixfmt
      ];
    };

  flake.modules.homeManager.applications.imports = [ self.modules.homeManager.aiTool ];

  flake.modules.nixos.ai-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [
        ".config/opencode"
        ".shared/opencode"
        ".state/opencode"
      ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.ai-preservation ];
}
