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
}
