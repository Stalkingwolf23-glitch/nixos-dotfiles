{self, ...}: {
  flake.modules.homeManager.gallery-dl = {
    programs.gallery-dl = {
      enable = true;
      settings = {
        base-directory = "~/local/gallery-dl/";
      };
    };
  };

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.gallery-dl
  ];
}
