{
  inputs,
  system,
  pkgs,
  ...
}:

{
  imports = [
    inputs.kickstart-nixvim.homeManagerModules.default
  ];

  programs.nixvim.enable = true;

  # Trying out Zed
  programs.zed-editor.enable = true;
}
