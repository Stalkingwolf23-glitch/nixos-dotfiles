{ pkgs, ... }:

{
  programs.fuzzel = {
    enable  = true;
    settings = {
      main = {
        terminal = "alacritty";
        prompt = "> ";
        layer = "overlay";
        exit-on-keyboard-focus-loss = "yes";
        line-height = 20;
      };
      border = {
        radius = 17;
        width = 1;
      };
      dmenu = {
        exit-immediately-if-empty="yes";
      };
    };
  };
}
