{
  programs.zen-browser.profiles."default".search = {
    force = true;
    default = "ddg";
    engines = {
      searchix = {
        name = "Searchix";
        urls = [
          {
            template = "https://searchix.ovh/?query={query}";
            params = [
              {
                name = "query";
                value = "query";
              }
            ];
          }
        ];
        definedAliases = [ "@sn" ];
      };
      github = {
        name = "Github Search";
        urls = [
          {
            template = "https://github.com/search?q={query}";
          }
        ];
        definedAliases = [ "@gh" ];
      };
    };
  };
}
