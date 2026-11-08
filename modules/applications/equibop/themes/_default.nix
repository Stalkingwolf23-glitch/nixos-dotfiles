{
  imports = [
    ./_codeBlocks.nix
    ./_quickCSS.nix
  ];
  programs.equibop.equicord.settings = {
    enabledThemeLinks = [
      "https://raw.githubusercontent.com/DiscordStyles/HorizontalServerList/deploy/HorizontalServerList.theme.css"
    ];
    enabledThemes = [
      "HorizontalServerList.theme.css"
      "codeBlocks.css"
    ];
    "enableOnlineThemes" = true;
    "useQuickCSS" = true;
  };
}
