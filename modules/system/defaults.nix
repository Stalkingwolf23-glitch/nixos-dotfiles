{ inputs, ... }:

{
  flake.modules.nixos.defaults = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        cachix
        xdg-utils
        wget
        zsh
        git
        home-manager
        wpa_supplicant
        nextdns
        ffmpeg
        killall
        egl-wayland
        brightnessctl
        samrewritten
        catppuccin-papirus-folders
        deepfilternet
        inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

      environment.shells = with pkgs; [ zsh ];
      users.defaultUserShell = pkgs.zsh;
      programs.zsh.enable = true;
      programs.dconf.enable = true;

      environment.localBinInPath = true;

      documentation = {
        enable = false;
        dev.enable = false;
        doc.enable = false;
        info.enable = false;
        man.enable = false;
        nixos.enable = false;
      };
    };
}
