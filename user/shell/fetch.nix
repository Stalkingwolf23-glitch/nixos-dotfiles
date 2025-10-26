{
  home.file.".config/fastfetch/logo.png".source = ../../assets/config/madoka.png;

  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "kitty";
        source = "~/.config/fastfetch/logo.png";
        padding = {
          top = 1;
          left = 3;
        };
        width = 38;
      };

      modules = [
        "break"
        {
          type = "custom";
          format = "─────────── System ───────────";
        }
        {
          type = "os";
          key = "󱄅 OS";
          keyColor = "33";
        }
        {
          type = "kernel";
          key = " Kernel";
          keyColor = "33";
        }
        {
          type = "uptime";
          key = "󰔟 Uptime";
          keyColor = "33";
        }
        {
          type = "command";
          key = "󱎫 OS Age";
          keyColor = "33";
          text = "b=$(stat -c %W /); n=$(date +%s); echo $(( (n - b) / 86400 )) days";
        }
        {
          type = "custom";
          format = "────────── Hardware ──────────";
        }
        {
          type = "cpu";
          key = " CPU";
          showPeCoreCount = true;
          keyColor = "36";
        }
        {
          type = "gpu";
          key = "󰍛 GPU";
          keyColor = "36";
        }
        {
          type = "memory";
          key = " Memory";
          keyColor = "36";
        }
        {
          type = "custom";
          format = "────────── Software ─────────";
        }
        {
          type = "wm";
          key = "󰇄 Compositor";
          keyColor = "33";
        }
        {
          type = "terminal";
          key = " Terminal";
          keyColor = "33";
        }
        {
          type = "shell";
          key = " Shell";
          keyColor = "33";
        }
        {
          type = "packages";
          key = " Packages";
          keyColor = "33";
        }
        {
          type = "custom";
          format = "───────────────────────────────";
        }
        "break"
      ];
    };
  };
}
