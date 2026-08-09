{
  flake.modules.nixos.syncthing = {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "stalkingwolf";
      group = "users";
      configDir = "/home/stalkingwolf/.config/syncthing";
      settings = {
        devices = {
          "Phone" = {
            id = "L2UJYUN-UHG2CPD-B5TSAZE-6JKBGXX-REQFW5K-G7U3QTP-EV4R3UD-V725YQO";
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
  };
}
