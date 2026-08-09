{
  flake.modules.homeManager.zen = {
    programs.zen-browser.profiles."default".sine.enable = true;
    # Placeholder until zen-browser flake supports declarative sine mods
    # https://github.com/0xc000022070/zen-browser-flake/issues/314
  };
}
