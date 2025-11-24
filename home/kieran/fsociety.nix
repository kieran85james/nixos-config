{ config, pkgs, ... }:

{
  home.username = "elliot";
  home.homeDirectory = "/home/elliot";
  
  imports = [
    ../common
    ./dotfiles
    ./home.nix
  ];

  # Enable Home Manager modules
  homeManagerModules.gnome.enable = true;

  # Enable Home Manager features
  features.cli.bash.enable = true;
  
  # Install packages for this user only
  home.packages = with pkgs; [];

  gtk.enable = true;
  gtk.gtk3.bookmarks = [
    "file:///home/elliot/downloads Downloads"
    "file:///home/elliot/media/documents Documents"
    "file:///home/elliot/media/music Music"
    "file:///home/elliot/media/pictures Pictures"
    "file:///home/elliot/media/videos Videos"
    "file:///home/elliot/projects Projects"
    "file:///home/elliot/projects/personal Personal Projects"
    "file:///home/elliot/projects/jobs/app APP Wholesale"
    "smb://ds923-plus/ DS923-PLUS"
  ];
}
