{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./noctalia.nix
    ./vicinae.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    extraConfig = ''
      env = NIXOS_OZONE_WL, 1
      ${builtins.readFile ../../assets/config/hyprland.conf}
      exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
    '';
    plugins = [
      inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
    ];
  };

  services.easyeffects.enable = true;

  home.file.".config/hypr/hypridle.conf".source = ../../assets/config/hypridle.conf;
  home.file.".config/hypr/hyprlock.conf".source = ../../assets/config/hyprlock.conf;
  home.file.".config/equibop/themes".recursive = true;
  home.file.".config/equibop/themes".source = ../../assets/config/vesktop;
}
