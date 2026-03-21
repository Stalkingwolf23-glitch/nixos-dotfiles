{
  pkgs,
  userSettings,
  ...
}:

{
  home.packages = [ pkgs.git ];
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = userSettings.name;
        email = userSettings.email;
      };
      init.defaultBranch = "main";
      safe.directory = [
        ("/home/" + userSettings.username + "local/nixos")
        ("/home/" + userSettings.username + "local/nixos/.git")
      ];
    };
  };

  programs.gitui = {
    enable = true;
    keyConfig = ''
      (
        move_left: Some(( code: Char('h'), modifiers: "")),
        move_right: Some(( code: Char('l'), modifiers: "")),
        move_up: Some(( code: Char('k'), modifiers: "")),
        move_down: Some(( code: Char('j'), modifiers: "")),

        stash_open: Some(( code: Char('l'), modifiers: "")),
        open_help: Some(( code: F(1), modifiers: "")),

        status_reset_item: Some(( code: Char('U'), modifiers: "SHIFT")),
      )
    '';
  };
}
