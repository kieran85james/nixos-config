{ config, pkgs, ... }:

let
  browser = "google-chrome.desktop";
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
        "text/html" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xht" = browser;
        "application/x-extension-xhtml" = browser;
        "application/xhtml+xml" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/chrome" = [browser];
        "x-scheme-handler/ftp" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/unknown" = browser;

        "application/pdf" = browser;
        "application/json" = ["gnome-text-editor.desktop"];
        "application/toml" = "gnome-text-editor.desktop";

        "text/plain" = "gnome-text-editor.desktop";

        "video/*" = ["org.gnome.Totem.dekstop"];
        "video/mp4" = ["org.gnome.Totem.dekstop"];
        "audio/*" = ["org.gnome.Totem.dekstop"];
        "audio/mp3" = ["org.gnome.Totem.dekstop"];
        "image/*" = ["org.gnome.loupe.desktop"];
        "image/jpg" = ["org.gnome.loupe.desktop"];
        "image/png" = ["org.gnome.loupe.desktop"];
        
        "x-scheme-handler/spotify" = ["spotify.desktop"];
      };
    };
  };

}
