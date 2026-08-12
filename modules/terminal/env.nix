{ self, ... }:

{
  flake.modules.homeManager.env =
    { config, ... }:
    {
      home.sessionVariables = {
        EDITOR = "nvim";
        TACK_NIX_CONF_TOKENS = "1";
      };
    };

  flake.modules.homeManager.terminal.imports = [ self.modules.homeManager.env ];
}
