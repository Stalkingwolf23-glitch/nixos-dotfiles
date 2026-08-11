{ self, ... }:

{
  flake.modules.homeManager.xdg = {
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

        # Audio
        "audio/mpeg" = "rmpc.desktop";
        "audio/flac" = "rmpc.desktop";
        "audio/ogg" = "rmpc.desktop";
        "audio/wav" = "rmpc.desktop";
        "audio/x-wav" = "rmpc.desktop";
        "audio/aac" = "rmpc.desktop";
        "audio/opus" = "rmpc.desktop";

        # Text
        "text/plain" = "helix.desktop";
        "text/markdown" = "helix.desktop";
        "text/csv" = "helix.desktop";
        "text/xml" = "helix.desktop";
        "text/yaml" = "helix.desktop";
        "application/json" = "helix.desktop";
        "application/toml" = "helix.desktop";
        "application/xml" = "helix.desktop";
        "application/javascript" = "helix.desktop";
        "application/x-shellscript" = "helix.desktop";

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

  flake.modules.homeManager.desktop.imports = [ self.modules.homeManager.xdg ];
}
