{ self, ... }:

{
  flake.modules.nixos.steam =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wineWow64Packages.base
        winetricks
        protontricks
        lutris
        samrewritten
        r2mod_cli
        # moonlight-qt # Just for streaming from laptop when neede
      ];

      environment.sessionVariables = {
        R2MOD_INSTALL_DIR = "/mnt/osiris/Games/Steam/steamapps/common/Risk of Rain 2";
        R2MOD_COMPAT_DIR = "/mnt/osiris/Games/Steam/steamapps/compatdata/632360";
      };

      programs.steam = {
        enable = true;
        package = pkgs.steam.override {
          extraEnv = {
            MANGOHUD = "1";
            PROTON_DXVK_LOWLATENCY = "1";
            DXVK_CONFIG = "dxvk.latencySleep = True; dxgi.maxFrameRate = 179l d3d9.maxFrameRate = 179";
            VK3D_FRAME_RATE = "179";
          };
        };
        extraPackages = with pkgs; [
          gamescope-wsi
        ];
        extraCompatPackages = with pkgs; [
          proton-cachyos
        ];
      };

      programs.gamescope = {
        enable = true;
        capSysNice = false;
      };
    };

  flake.modules.nixos.gaming.imports = [ self.modules.nixos.steam ];

  flake.modules.nixos.steam-preservation = {
    preservation.preserveAt."/persist".users.stalkingwolf = {
      directories = [
        ".config/r2mod_cli"
        ".local/share/Steam"
        ".local/share/Tabletop Simulator"
        ".local/share/lutris"
        ".local/share/umu"
      ];
    };
  };

  flake.modules.nixos.preservation.imports = [ self.modules.nixos.steam-preservation ];
}
