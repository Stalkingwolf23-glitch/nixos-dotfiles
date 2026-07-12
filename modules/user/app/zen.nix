{
  inputs,
  ...
}:
{
  flake-file.inputs.zen-browser.url = "github:0xc000022070/zen-browser-flake/beta";

  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    profiles."default" = {
      userContent = ''
        ${builtins.readFile ../../assets/zen/userContent.css}
      '';

      extraConfig = ''
        ${builtins.readFile ../../assets/zen/user.js}
      '';

      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.workspaces.natural-scroll" = true;
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";
      };

      sine = {
        enable = true;
      };
    };
  };
}
