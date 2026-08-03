{
  programs.nixcord.config = {
    enabledThemeLinks = [
      "https://raw.githubusercontent.com/DiscordStyles/HorizontalServerList/deploy/HorizontalServerList.theme.css"
    ];
    # themes =
    enabledThemes = [
      "HorizontalServerList.theme.css"
      "Catppuccin Mocha Blue.theme.css"
    ];
  };
}
