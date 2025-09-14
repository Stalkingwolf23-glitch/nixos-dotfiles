{ config, pkgs, ... }:

{
  programs.starship = {
  enable = true;
  enableZshIntegration = true;
  settings = {
    #Minimal left prompt
    add_newline = true;
    format = "$directory$character";
    #palette = "catppuccin_mocha";
    #move rest of prompt to the right
    right_format = "$git_branch$gitstatus$gitstate";
    command_timeout = 1000;

    directory = {
      truncation_length = 2;
    };

    character = {
      success_symbol = "[❯](bold green)";
      error_symbol = "[❯](bold red)";
    };

    git_branch = {
      format = "[$symbol$branch(:$remote_branch)]($style)";
    };

    git_status = {
      format = "$all_status$ahead_behind($style)";
      style = "bold red";
      modified = "[ 󱑍](red)";
      staged = "[ +$count](green)";
      renamed = " rn(red)";
      conflicted	= " =(red)";
      ahead	= " ⇡(yellow)";
      behind	= " ⇣(yellow)";
      diverged	= " ⇕(red)";
      up_to_date	= "";
      untracked	= " ?(red)";
      stashed	= " \$(red)";
      deleted	= " ✘(red)";
    };
  };
};
}