{
  pins.catppuccin-zen-sine = {
    url = "https://github.com/Cole-Abbott/catppuccin-zen-sine";
    flake = false;
  };

  flake.modules.homeManager.zen = {inputs, ...}: {
    programs.zen-browser.profiles."default" = {
      settings = {
        "catppuccin.sine.flavor" = "mocha";
        "catppuccin.sine.accent" = "blue";
      };
      userContent = builtins.readFile "${inputs.catppuccin-zen-sine}/userContent.css";
    };
  };
}
