{
  inputs,
  ...
}:
{
  flake-file.inputs.zen-browser.url = "github:0xc000022070/zen-browser-flake/beta";

  flake.modules.homeManager.zen = { inputs, ... }:
    {
      imports = [
        inputs.zen-browser.homeModules.beta
      ];

      programs.zen-browser.enable = true;
    };
}
