{ self, ... }:

{
  flake.modules.homeManager.eza = {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
        "-1"
        "--short-nix"
        "--header"
      ];
    };
  };

  flake.modules.homeManager.terminal.imports = [ self.modules.homeManager.eza ];
}
