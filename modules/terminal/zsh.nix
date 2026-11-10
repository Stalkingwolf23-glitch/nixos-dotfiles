{self, ...}: {
  flake.modules.homeManager.zsh = {
    pkgs,
    lib,
    ...
  }: {
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

      initContent = lib.mkMerge [
        ''
          microfetch

          [ "$TERM" = "dumb" ] && unsetopt zle && PS1='$ '
          [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

          function zvm_after_init() { bindkey '^ ' autosuggest-accept }

          zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2
          zstyle ':completion:*' menu no
        ''

        (lib.mkAfter ''
          if [[ "$TERM" != "dumb" ]]; then
            TRANSIENT_PROMPT="''${PROMPT// prompt / prompt --profile transient }"

            function transient-prompt() {
              PROMPT="$TRANSIENT_PROMPT" RPROMPT="" zle .reset-prompt
            }

            autoload -Uz add-zle-hook-widget
            add-zle-hook-widget zle-line-finish transient-prompt
          fi
        '')
      ];
    };

    programs.fzf.enable = true;
    programs.fzf.enableZshIntegration = true;
    programs.zoxide.enable = true;
    programs.zoxide.enableZshIntegration = true;
  };

  flake.modules.homeManager.terminal.imports = [
    self.modules.homeManager.zsh
  ];

  flake.modules.nixos.zsh = {pkgs, ...}: {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };

  flake.modules.nixos.common.imports = [
    self.modules.nixos.zsh
  ];

  flake.modules.nixos.zsh-preservation = {user, ...}: {
    preservation.preserveAt."/persist".users.${user} = {
      directories = [".local/share/zoxide"];
      files = [".zsh_history"];
    };
  };

  flake.modules.nixos.preservation.imports = [self.modules.nixos.zsh-preservation];
}
