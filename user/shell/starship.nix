{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = "[╭╴](fg:arrow)$username$os$git_branch(at $directory)
[╰─](fg:arrow)$character";
      right_format = "$cmd_duration $time";
      command_timeout = 1000;

      directory = {
        truncation_length = 2;
        style = "fg:blue";
        read_only_style = "fg:blue";
        before_repo_root_style = "fg:blue";
        truncation_symbol = "…/";
        truncate_to_repo = true;
        read_only = "  ";
        format = "[$path](bold $style)[$read_only]($read_only_style) ";
      };

      os = {
        symbols = {
          Alpine = " ";
          Arch = " ";
          Debian = " ";
          EndeavourOS = " ";
          Fedora = " ";
          Windows = " ";
          Mint = " ";
          openSUSE = " ";
          Linux = " ";
          Manjaro = " ";
          NixOS = " ";
          Pop = " ";
          SUSE = " ";
          Macos = " ";
          Ubuntu = " ";
        };
        style = "bold blue";
        disabled = true;
      };

      username = {
        style_user = "bold blue";
        style_root = "bold orange";
        format = "[$user](fg:$style) ";
        disabled = false;
        show_always = true;
      };

      character = {
        success_symbol = "[](fg:arrow)";
        error_symbol = "[](fg:red)";
      };

      time = {
        disabled = false;
        format = "[󱑈 $time]($style)";
        time_format = "%H:%M";
        style = "bold fg:time";
      };

      cmd_duration = {
        disabled = false;
        format = "[ $duration]($style)";
        style = "bold fg:duration";
        min_time = 500;
      };

      git_branch = {
        style = "bold fg:orange";
        symbol = " ";
        format = "via [$symbol$branch]($style) ";
      };

      git_status = {
        style = "fg:text_color bg:orange";
        disabled = true;
        format = "[ $all_status$ahead_behind ]($style)";
      };
    };
  };
}
