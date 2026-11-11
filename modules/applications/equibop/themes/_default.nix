{
  imports = [
    ./_codeBlocks.nix
    ./_quickCSS.nix
  ];
  programs.equibop.equicord.settings = {
    enabledThemes = ["codeBlocks.css"];
    "enableOnlineThemes" = true;
    "useQuickCSS" = true;
  };
}
