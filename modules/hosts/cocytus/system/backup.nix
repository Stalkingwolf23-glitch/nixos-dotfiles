{ self, ... }:

{
  flake.modules.nixos.backup = {
    services.sanoid = {
      enable = true;

      templates.home = {
        hourly = 5;
        daily = 7;
        monthly = 3;
        autosnap = true;
        autoprune = true;
      };
      datasets."rpool/local/home" = {
        useTemplate = [ "home" ];
        recursive = false;
      };
    };

    services.syncoid = {
      enable = true;
      interval = "*-*-* 00:00:00";
      user = "syncoid";
      commands."home" = {
        source = "rpool/local/home";
        target = "backup/cocytus/home";
        recursive = false;
        sendOptions = "c";
      };
    };
    systemd.timers."syncoid-home".timerConfig.Persistent = true;
  };

  flake.modules.nixos.cocytus-system.imports = [ self.modules.nixos.backup ];
}
