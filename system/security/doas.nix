{ userSettings, pkgs, ... }:

{
  # Doas instead of sudo
  security.doas.enable = false;
  security.sudo.enable = true;
  security.doas.extraRules = [
    {
      users = [ "${userSettings.username}" ];
      keepEnv = true;
      persist = true;
    }
    {
      users = [ "${userSettings.username}" ];
      cmd = "tee";
      noPass = true;
    }
  ];

  environment.systemPackages = [
    (pkgs.writeScriptBin "sudo" ''exec doas "$@"'')
  ];
}
