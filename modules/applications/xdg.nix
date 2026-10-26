{self, ...}: {
  flake.modules.homeManager.xdg = {
    xdg.userDirs = {
      enable = true;
      desktop = null;
      videos = null;
      music = "/mnt/wd_linux/Stuff/Music";
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        # Archives
        "application/zip" = "org.kde.ark.desktop";
        "application/x-tar" = "org.kde.ark.desktop";
        "application/x-7z-compressed" = "org.kde.ark.desktop";
        "application/gzip" = "org.kde.ark.desktop";
        "application/x-rar" = "org.kde.ark.desktop";
        "application/x-bzip2" = "org.kde.ark.desktop";
        "application/x-xz" = "org.kde.ark.desktop";
        "application/pak" = "org.kde.ark.desktop";

        # Images
        "image/jpeg" = "qimgv.desktop";
        "image/png" = "qimgv.desktop";
        "image/tiff" = "qimgv.desktop";
        "image/bmp" = "qimgv.desktop";
        "image/svg+xml" = "qimgv.desktop";
        "image/avif" = "qimgv.desktop";

        # Browser
        "text/html" = "zen-beta.desktop";
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
        "x-scheme-handler/ftp" = "zen-beta.desktop";

        "inode/directory" = "org.kde.dolphin.desktop";
        "x-scheme-handler/discord" = "equibop.desktop";
      };
    };
  };

  flake.modules.homeManager.applications.imports = [self.modules.homeManager.xdg];
}
