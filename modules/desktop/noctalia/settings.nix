{
  flake.modules.homeManager.noctalia = {
    programs.noctalia.settings = builtins.fromTOML (builtins.readFile ./export.toml);
  };
}
