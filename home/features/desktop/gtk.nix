{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.gtk;
in {
  options.features.desktop.gtk.enable =
    mkEnableOption "manage GTK configuration";

  config = mkIf cfg.enable {
    gtk.enable = true;
    gtk.gtk3.bookmarks = [
      "file:///${config.home.homeDirectory}/downloads Downloads"
      "file:///${config.home.homeDirectory}/media/documents Documents"
      "file:///${config.home.homeDirectory}/media/music Music"
      "file:///${config.home.homeDirectory}/media/pictures Pictures"
      "file:///${config.home.homeDirectory}/media/videos Videos"
      "file:///${config.home.homeDirectory}/projects Projects"
      "file:///${config.home.homeDirectory}/projects/personal Personal Projects"
      "file:///${config.home.homeDirectory}/projects/jobs/app APP Wholesale"
      "smb://ds923-plus/ DS923-PLUS"
    ];
  };
}
