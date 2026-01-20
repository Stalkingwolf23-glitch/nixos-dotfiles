{
  pkgs,
  ...
}:

{
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;
    events = {
      before-sleep = "noctalia-shell ipc call lockScreen lock";
    };
    timeouts = [
      {
        timeout = 600;
        command = "noctalia-shell ipc call lockScreen lock";
      }
      {
        timeout = 3600;
        command = "noctalia-shell ipc call lockScreen lock";
      }
    ];
  };
}
