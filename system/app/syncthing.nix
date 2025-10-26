{ userSettings, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "${userSettings.username}";
    group = "users";
    configDir = "/home/${userSettings.username}/.config/syncthing";
    settings = {
      devices = {
        "Phone" = {
          id = "JQDSJXR-N2FPVJE-DOLO65G-GOEIUDF-MFCVLEV-TSI4QWZ-QKGSCJD-YBZLTQT";
        };
      };
      folders = {
        Comics = {
          label = "Comics";
          path = "/home/stalkingwolf/Documents/sync/Comics";
          id = "tygcc-vkduz";
          devices = [ "Phone" ];
        };
        Wallpapers = {
          label = "Wallpapers";
          path = "/home/stalkingwolf/Documents/sync/Wallpapers";
          id = "m2kja-39hpz";
          devices = [ "Phone" ];
        };
        Misc = {
          label = "Misc";
          path = "/home/stalkingwolf/Documents/sync/Misc";
          id = "05cv7-te2a8";
          devices = [ "Phone" ];
        };
      };
    };
  };
}
