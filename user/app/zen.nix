{
  inputs,
  config,
  zen-browser,
  pkgs,
  ...
}:
let
  custom-zen =
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta-unwrapped.overrideAttrs
      (oldAttrs: rec {
        libName = "zen-bin-*";
        fsautoconfig = (
          builtins.fetchurl {
            url = "https://raw.githubusercontent.com/sineorg/bootloader/main/program/config.js";
            sha256 = "117a6gkaz1kinjflfzqc6qsb4r06x93w08q4lfdzh5a1cng95s5v";
          }
        );
        configpref = (
          builtins.fetchurl {
            url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/refs/heads/master/program/defaults/pref/config-prefs.js";
            sha256 = "sha256-a/0u0TnRj/UXjg/GKjtAWFQN2+ujrckSwNae23DBfs4=";
          }
        );

        postInstall = (oldAttrs.postInstall or "") + ''
          for libdir in "$out"/lib/${libName}; do
                  chmod -R u+w "$libdir"
                  cp "${fsautoconfig}" "$libdir/config.js"
                  mkdir -p "$libdir/defaults/pref"
                  cp "${configpref}" "$libdir/defaults/pref/config-pref.js"
                done;
        '';
      });
in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  home.file.".config/zen/default/chrome".recursive = true;
  home.file.".config/zen/default/chrome".source = ../../assets/zen/sine;

  programs.zen-browser = {
    enable = true;
    package = (config.lib.nixGL.wrap ((pkgs.wrapFirefox) custom-zen { }));

    profiles."default" = {
      userContent = ''
        ${builtins.readFile ../../assets/zen/userContent.css}
      '';
      extraConfig = ''
        ${builtins.readFile ../../assets/zen/user.js}
      '';
    };
  };
}
