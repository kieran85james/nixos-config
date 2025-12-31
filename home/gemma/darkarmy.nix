{ config, pkgs, ... }:

{
  home.username = "darlene";
  home.homeDirectory = "/home/darlene";
  
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
  features.desktop.fonts.enable = false;
  features.desktop.coding.enable = false;
  
  # Install packages for this user only
  home.packages = with pkgs; [];
}
