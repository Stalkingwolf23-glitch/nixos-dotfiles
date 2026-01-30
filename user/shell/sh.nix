{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    completionInit = "autoload -U compinit && compinit -i";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    plugins = [
      {
        name = "zsh-bd";
        src = "${pkgs.zsh-bd}/share/zsh-bd";
      }
      {
        name = "zsh-you-should-use";
        src = "${pkgs.zsh-you-should-use}/share/zsh-you-should-use";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
      {
        name = "zsh-autopair";
        src = "${pkgs.zsh-autopair}/share/zsh-autopair";
      }
      {
        name = "zsh-fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];

    shellAliases = {
      ll = "eza --icons --group-directories-first -1";
      ls = "eza --icons  --group-directories-first -1";
      tree = "eza --icons --tree --group-directories-first";
      fetch = "fastfetch";
      ".." = "cd ..";
    };

    initContent = ''
      PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
        %F{green}→%f "
      RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
      [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
      bindkey '^P' history-beginning-search-backward
      bindkey '^N' history-beginning-search-forward

      zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
    '';
  };

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
}
