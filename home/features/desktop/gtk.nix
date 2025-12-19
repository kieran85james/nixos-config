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
      "file:///home/${config.home.homeDirectory}/downloads Downloads"
      "file:///home/${config.home.homeDirectory}/media/documents Documents"
      "file:///home/${config.home.homeDirectory}/media/music Music"
      "file:///home/${config.home.homeDirectory}/media/pictures Pictures"
      "file:///home/${config.home.homeDirectory}/media/videos Videos"
      "file:///home/${config.home.homeDirectory}/projects Projects"
      "file:///home/${config.home.homeDirectory}/projects/personal Personal Projects"
      "file:///home/${config.home.homeDirectory}/projects/jobs/app APP Wholesale"
      "smb://ds923-plus/ DS923-PLUS"
    ];
  };
}
