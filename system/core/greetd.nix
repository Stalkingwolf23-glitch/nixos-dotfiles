{
  pkgs,
  ...
}:

{
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --user-menu --asterisks --time --theme 'text=white;prompt=white;time=white;action=gray;container=black;input=lightgray' --cmd 'niri-session'";
        user = "greeter";
      };
    };
  };

  security.pam.services.greetd.enableGnomeKeyring = true;
}
