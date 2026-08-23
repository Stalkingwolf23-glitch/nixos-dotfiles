{
  flake.modules.homeManager.nixcord = {
    programs.nixcord.config = {
      enabledThemeLinks = [
        "https://raw.githubusercontent.com/DiscordStyles/HorizontalServerList/deploy/HorizontalServerList.theme.css"
      ];
      # themes =
      enabledThemes = [
        "HorizontalServerList.theme.css"
      ];
    };
  };
}
