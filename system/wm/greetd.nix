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

        # Hyprland
        # command = "${pkgs.tuigreet}/bin/tuigreet --remember --user-menu --asterisks --time --theme 'text=white;prompt=white;time=white;action=gray;container=black;input=lightgray' --cmd '${pkgs.uwsm}/bin/uwsm start hyprland-uwsm.desktop'";
      };
    };
  };

  security.pam.services.greetd.enableGnomeKeyring = true;
}
