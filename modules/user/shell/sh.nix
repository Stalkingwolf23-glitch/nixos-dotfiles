{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    completionInit = "autoload -U compinit && compinit -i";
    autosuggestion.enable = false;
    syntaxHighlighting.enable = false;
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
        name = "vi-mode";
        file = "zsh-vi-mode.plugin.zsh";
        src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
      }
      {
        name = "zsh-autosuggestions";
        src = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
        file = "zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-fzf-tab";
        file = "fzf-tab.plugin.zsh";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "zsh-f-sy-h";
        file = "F-Sy-H.plugin.zsh";
        src = "${pkgs.zsh-f-sy-h}/share/zsh/site-functions";
      }
    ];

    initContent = ''
      fastfetch --config ~/.config/fastfetch/compact.jsonc

      PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
        %F{green}→%f "
      RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
      [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
      [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

      function zvm_after_init() { bindkey '^ ' autosuggest-accept }

      zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2
      zstyle ':completion:*' menu no
    '';
  };

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
}
