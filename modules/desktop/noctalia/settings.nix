{
  flake.modules.homeManager.noctalia = {inputs, ...}: {
    imports = [
      inputs.nix-assets.homeManagerModules.noctalia-templates
    ];
    programs.noctalia.settings = builtins.fromTOML (builtins.readFile ./export.toml);
  };
}
