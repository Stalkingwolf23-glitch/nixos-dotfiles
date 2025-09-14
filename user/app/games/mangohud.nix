{ pkgs, lib, ... }:

{
  programs.mangohud.enable = true;
  programs.mangohud.settings = {
    horizontal = true;
    background_alpha = lib.mkDefault 0.6;
    round_corners = 0;
    position = "top-center";

    pci_dev = "0:01:00.0";
    table_columns = 3;
    gpu_text = "GPU";
    gpu_stats = true;
    gpu_load_change = true;
    gpu_load_value = "50,90";
    cpu_text = "CPU";
    cpu_stats = true;
    cpu_load_change = true;
    cpu_load_value = "50,90";
    vram = true;
    ram = true;
    fps = true;

    fps_limit_method = "late";
    fps_color_change = true;
    fps_value = "30,60";

    time = true;
    time_format = "%R";
  };

#   hardware.opengl = {
#     extraPackages = with pkgs; [mangohud];
#     extraPackages32 = with pkgs; [mangohud];
#   };
}
