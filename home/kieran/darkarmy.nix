{ config, pkgs, ... }:

{
  home.username = "otto";
  home.homeDirectory = "/home/otto";
  
  imports = [
    ../common

    ../features/cli
    ../features/desktop
    
    ./dotfiles
    ./home.nix
  ];

  # Enable Home Manager modules
  homeManagerModules.gnome.enable = true;

  # Enable Home Manager features
  features.cli.bash.enable = true;

  features.desktop.xdg.enable = true;
  features.desktop.gtk.enable = true;
  features.desktop.fonts.enable = true;
  features.desktop.coding.enable = true;
  
  # Install packages for this user only
  home.packages = with pkgs; [];
}
