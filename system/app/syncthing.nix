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
        "Phone" = { id = "JQDSJXR-N2FPVJE-DOLO65G-GOEIUDF-MFCVLEV-TSI4QWZ-QKGSCJD-YBZLTQT"; };
      };
      folders = {
        "9qsgl-trgej" = {
          path = "/home/${userSettings.username}/Documents/sync";
          devices = [
            "Phone"
          ];
        };
      };
    };
  };
}