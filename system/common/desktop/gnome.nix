{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Exclude GNOME packages.
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-tour
    gnome-console
    gnome.gnome-maps
    gnome.gnome-clocks
    gnome.gnome-music
  ];

  # GNOME packages.
  environment.systemPackages = with pkgs; [
    gnome.gnome-boxes
    gnome.gnome-terminal
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome-online-accounts
  ];

  # Enable programs.
  programs = {
    dconf.enable = true;
  };
}