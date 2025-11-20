{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
    network.startWhenNeeded = true;
  };

  services.mpd-mpris = {
    enable = true;
    mpd.useLocal = true;
  };
}
