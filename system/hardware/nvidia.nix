{ config, pkgs, systemSettings, ... }:

{
  # OpenGL
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];

  # Nvidia
  services.xserver.videoDrivers = [systemSettings.gpuType];

  hardware.nvidia = {
    modesetting.enable = true;

    # Open source kernel module
    open = true;

    # Enables Nvidia settings menu, access through "nvidia-settings"
    nvidiaSettings = true;

    #Nvidia power management, experimental and can cause sleep/suspend to fail. Enable if applications are crashing after sleep. Saves whole VRAM to /tmp/ instead of necessity}
    powerManagement.enable = false;

    #Fine-grained power management. Turns off GPU when not used. Experimental and works only for Turing onwards
    powerManagement.finegrained = false;

    # Select appropriate driver version
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
