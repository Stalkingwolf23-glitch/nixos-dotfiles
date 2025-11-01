{
  inputs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  # home.file.".zen/default/chrome".recursive = true;
  # home.file.".zen/default/chrome".source = ../../assets/zen/fx-autoconfig;
  programs.zen-browser = {
    enable = true;

    profiles."default" = {
      userChrome = ''
        ${builtins.readFile ../../assets/zen/userChrome.css}
      '';
      userContent = ''
        ${builtins.readFile ../../assets/zen/userContent.css}
      '';
      extraConfig = ''
        ${builtins.readFile ../../assets/zen/user.js}
      '';
    };
    extraPrefsFiles = [
      (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/program/config.js";
        sha256 = "1mx679fbc4d9x4bnqajqx5a95y1lfasvf90pbqkh9sm3ch945p40";
      })
    ];
  };
}
