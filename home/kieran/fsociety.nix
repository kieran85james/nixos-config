{ config, pkgs, ... }:

{
  home.username = "elliot";
  home.homeDirectory = "/home/elliot";
  
  imports = [
    ../common

    ../features/cli
    ../features/desktop
    
    ./dotfiles
    ./home.nix
    ./secrets.nix
  ];

  # Enable Home Manager modules
  homeManagerModules.gnome.enable = true;

  # Enable Home Manager features
  features.cli.bash.enable = true;

  features.desktop.xdg.enable = true;
  features.desktop.gtk.enable = true;
  features.desktop.fonts.enable = true;
  features.desktop.coding.enable = true;

  # Add extra SSH config
  programs.ssh.extraConfig = config.age.secrets.ssh-config-kieran.path;
  
  # Install packages for this user only
  home.packages = with pkgs; [];
}
