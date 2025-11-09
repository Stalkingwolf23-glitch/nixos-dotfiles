{
  config,
  pkgs,
  systemSettings,
  lib,
  ...
}:

{
  # OpenGL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  # Nvidia
  services.xserver.videoDrivers = [ systemSettings.gpuType ];

  hardware.nvidia = {
    modesetting.enable = true;

    # Open source kernel module
    open = true;

    # Enables Nvidia settings menu, access through "nvidia-settings"
    nvidiaSettings = true;

    #Nvidia power management, experimental and can cause sleep/suspend to fail. Enable if applications are crashing after sleep. Saves whole VRAM to /tmp/ instead of necessity}
    powerManagement.enable = true;

    #Fine-grained power management. Turns off GPU when not used. Experimental and works only for Turing onwards
    powerManagement.finegrained = false;

    # Select appropriate driver version
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # Fix stupid Nvidia tty multimonitor scaling
  systemd.services.fbset = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    unitConfig = {
      Description = "Set framebuffer resolution";
      Before = "display-manager.service";
    };
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${lib.getExe pkgs.fbset} -xres 2560 -yres 1440 -match --all";
      RemainAfterExit = "yes";
      StandardOutput = "journal";
      StandardError = "journal";
    };
  };
}
