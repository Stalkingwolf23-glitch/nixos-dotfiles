{
  systemSettings,
  userSettings,
  inputs,
  pkgs,
  ...
}:

let
  noctalia-greeter = inputs.noctalia-greeter.packages.${systemSettings.system}.default;
  greeterConf = pkgs.writeText "greeter.conf" ''
    [session] 
    default = "niri"

    [user]
    default = "${userSettings.username}"

    [output]
    name = "DP-1"

    [appearance]
    scheme = "Tokyo-Night"
  '';
in
{
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${noctalia-greeter}/bin/noctalia-greeter-session -- --session niri";
        user = "greeter";
      };
      cursor = {
        theme = "Bibata-Modern-Classic";
        size = 24;
        package = pkgs.bibata-cursors;
      };
    };
  };

  security.pam.services.greetd.enableGnomeKeyring = true;

  systemd.tmpfiles.rules = [
    "d /var/lib/noctalia-greeter 0755 greeter greeter -"
    "L+ /var/lib/noctalia-greeter/greeter.conf - - - - ${greeterConf}"
  ];
}
