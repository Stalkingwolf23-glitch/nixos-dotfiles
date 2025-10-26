{
  pkgs,
  userSettings,
  ...
}:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.settings.user = {
    name = userSettings.name;
    email = userSettings.email;

  };
  programs.git.settings = {
    init.defaultBranch = "main";
    safe.directory = [
      ("/home/" + userSettings.username + "/nixos")
      ("/home/" + userSettings.username + "/nixos/.git")
    ];
  };
}
