{
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
      "text/plain" = "nvim.desktop";
      "text/markdown" = "nvim.desktop";
      "text/csv" = "nvim.desktop";
      "text/xml" = "nvim.desktop";
      "text/yaml" = "nvim.desktop";
      "application/json" = "nvim.desktop";
      "application/toml" = "nvim.desktop";
      "application/xml" = "nvim.desktop";
      "application/javascript" = "nvim.desktop";
      "application/x-shellscript" = "nvim.desktop";

      # Browser
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/ftp" = "zen-beta.desktop";

      "inode/directory" = "org.kde.dolphin.desktop";
      "x-scheme-handler/discord" = "equibop.desktop";
    };
  };
}
