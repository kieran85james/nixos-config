{ config, pkgs, ... }:

let
  browser = ["google-chrome.desktop"];
  archiveManager = ["org.gnome.FileRoller.desktop"];
  imageViewer = ["org.gnome.Loupe.desktop"];
in {

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/media/music";
      videos = "${config.home.homeDirectory}/media/videos";
      pictures = "${config.home.homeDirectory}/media/pictures";
      templates = "${config.home.homeDirectory}/templates";
      download = "${config.home.homeDirectory}/downloads";
      documents = "${config.home.homeDirectory}/media/documents";
      desktop = null;
      publicShare = "${config.home.homeDirectory}/public";
      extraConfig = {
        XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
        XDG_BOOK_DIR = "${config.home.homeDirectory}/media/books";
        XDG_PROJECTS_DIR = "${config.home.homeDirectory}/projects";
        XDG_JOBS_DIR = "${config.home.homeDirectory}/projects/jobs";
        XDG_APP_DIR = "${config.home.homeDirectory}/projects/jobs/app";
        XDG_APP_BAKS_DIR = "${config.home.homeDirectory}/projects/jobs/app/backups";
        XDG_PERSONAL_DIR = "${config.home.homeDirectory}/projects/personal";
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xht" = browser;
        "application/x-extension-xhtml" = browser;
        "application/xhtml+xml" = browser;
        "text/html" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/chrome" = browser;
        "x-scheme-handler/ftp" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/unknown" = browser;
        "x-scheme-handler/spotify" = ["spotify.desktop"];

        "audio/*" = ["org.gnome.Totem.dekstop"];
        "video/*" = ["org.gnome.Totem.dekstop"];
        "image/*" = imageViewer;

        "application/json" = browser;

        "application/pdf" = browser;

        # Archives / compressed files
        "application/x-7z-compressed" = archiveManager;
        "application/x-7z-compressed-tar" = archiveManager;
        "application/x-bzip" = archiveManager;
        "application/x-bzip-compressed-tar" = archiveManager;
        "application/x-compress" = archiveManager;
        "application/x-compressed-tar" = archiveManager;
        "application/x-cpio" = archiveManager;
        "application/x-gzip" = archiveManager;
        "application/x-lha" = archiveManager;
        "application/x-lzip" = archiveManager;
        "application/x-lzip-compressed-tar" = archiveManager;
        "application/x-lzma" = archiveManager;
        "application/x-lzma-compressed-tar" = archiveManager;
        "application/x-tar" = archiveManager;
        "application/x-tarz" = archiveManager;
        "application/x-xar" = archiveManager;
        "application/x-xz" = archiveManager;
        "application/x-xz-compressed-tar" = archiveManager;
        "application/zip" = archiveManager;
        "application/gzip" = archiveManager;
        "application/bzip2" = archiveManager;
        "application/vnd.rar" = archiveManager;

        # Images
        "image/jpeg" = imageViewer;
        "image/png" = imageViewer;
        "image/gif" = imageViewer;
        "image/webp" = imageViewer;
        "image/tiff" = imageViewer;
        "image/x-tga" = imageViewer;
        "image/vnd-ms.dds" = imageViewer;
        "image/x-dds" = imageViewer;
        "image/bmp" = imageViewer;
        "image/vnd.microsoft.icon" = imageViewer;
        "image/vnd.radiance" = imageViewer;
        "image/x-exr" = imageViewer;
        "image/x-portable-bitmap" = imageViewer;
        "image/x-portable-graymap" = imageViewer;
        "image/x-portable-pixmap" = imageViewer;
        "image/x-portable-anymap" = imageViewer;
        "image/x-qoi" = imageViewer;
        "image/svg+xml" = imageViewer;
        "image/svg+xml-compressed" = imageViewer;
        "image/avif" = imageViewer;
        "image/heic" = imageViewer;
        "image/jxl" = imageViewer;
      };
    };
  };

}
