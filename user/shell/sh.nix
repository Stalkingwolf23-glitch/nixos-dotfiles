{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    # enableCompletion = true;
    completionInit = "autoload -U compinit && compinit -i"; # prevents complaints about insecure directories
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    plugins = [
      {
        name = "zsh-bd";
        src = "${pkgs.zsh-bd}/share/zsh-bd";
      }
      {
        name = "zsh-fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/zsh-fzf-tab";
      }
      {
        name = "zsh-you-should-use";
        src = "${pkgs.zsh-you-should-use}/share/zsh-you-should-use";
      }
    ];

    shellAliases = {
      ll = "eza --icons --group-directories-first -1";
      ls = "eza --icons  --group-directories-first -1";
      tree = "eza --icons --tree --group-directories-first";
      fetch = "fastfetch";
      ".." = "cd ..";
      initExtra = ''
        PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
          %F{green}→%f "
        RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
        [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
        bindkey '^P' history-beginning-search-backward
        bindkey '^N' history-beginning-search-forward
      '';
    };
  };

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
}
