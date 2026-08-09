{
  flake.modules.homeManager.zen = {
    programs.zen-browser.profiles."default".bookmarks = {
      force = true;
      settings = [
        {
          name = "ProtonDB | Gaming know-how from the Linux and Steam Deck community";
          url = "https://www.protondb.com/";
        }
        {
          name = "Grids - SteamGridDB";
          url = "https://www.steamgriddb.com/grids";
        }
        {
          name = "ImgOps";
          url = "javascript:(function(){url='//imgops.com/imgops.js';document.body.appendChild(document.createElement('script')).src=url+'?'+new%20Date().getTime();})();";
        }
        {
          name = "Community Builds | StellaBase";
          url = "https://stella.ennead.cc/builds";
        }
        {
          name = "F95Zone";
          url = "https://f95zone.to/sam/latest_alpha/#/cat=games/page=1/tags=111";
        }
        {
          name = "Fribbels Star Rail Optimizer";
          url = "https://fribbels.github.io/hsr-optimizer#showcase?id=600533836";
        }
        {
          name = "Home | DoujinStyle.com - The Home of Doujin Music and Games";
          url = "https://doujinstyle.com/";
        }
        {
          name = "Caliross Walkthrough - Google Docs";
          url = "https://docs.google.com/document/d/16XOUX_KXz800cLQ7VledpazkEZjviWRPpXzR3iswfmE/edit?tab=t.0";
        }
        {
          name = "ar";
          url = "https://docs.google.com/spreadsheets/d/1jJmqidVcTNtizW5GAWZS4rQWEdibptiF4A-yvdwzsFM/edit?gid=183444163#gid=183444163";
        }
        {
          name = "Visual Novel Wiki";
          url = "https://www.vnwiki.xyz/";
        }
        {
          name = "V3.3 Dimmr Plains Map - Wuthering Waves Interactive Map";
          url = "https://wuthering-waves-map.appsample.com/?map=dimmr-plains#";
        }
        {
          name = "Searchix";
          url = "https://searchix.ovh/";
        }
        {
          name = "Steam Community :: Guide :: Team Building Guide";
          url = "https://steamcommunity.com/sharedfiles/filedetails/?id=3478844133";
        }
      ];
    };
  };
}
