{ pkgs, lib, ... }:

{
  programs.mangohud.enable = true;
  programs.mangohud.settings = {
    horizontal = true;
    background_color = "1E1E2E";
    background_alpha = 0.6;
    round_corners = 0;
    position = "top-center";

    ## Text ##
    font_size = 24;
    text_color = "CDD6F4";
    text_outline_color = "313244";

    ## GPU ##
    gpu_text = "GPU";
    gpu_list = 0;
    gpu_stats = true;
    gpu_temp = true;
    gpu_color = "A6E3A1";
    gpu_load_change = true;
    gpu_load_color = "CDD6F4,FAB387,F38BA8";

    ## CPU ##
    cpu_text = "CPU";
    cpu_stats = true;
    cpu_temp = true;
    cpu_color = "89B4FA";
    cpu_load_change = true;
    cpu_load_color = "CDD6F4,FAB387,F38BA8";

    ## RAM ##
    vram = false;
    ram = true;
    ram_color = "F5C2E7";

    ## FPS ##
    fps = true;
    fps_color_change = "F38BA8, F9E2AF, A6E3A1";
    fps_limit_method = "early";
    toggle_fps_limit = "Shift_L+F1";

    time = true;
    time_format = "%R";
  };
}
