{
  flake.modules.homeManager.noctalia = {
    home.file.".config/noctalia-settings.toml".source = ./noctalia.toml;
  };
}
