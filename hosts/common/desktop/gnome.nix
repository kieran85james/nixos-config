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
    gnome-maps
    gnome-clocks
    gnome-music
    totem
  ];

  # GNOME packages.
  environment.systemPackages = with pkgs; [
    gnome-boxes
    gnome-terminal
    gnome-tweaks
    dconf-editor
    gnome-online-accounts
  ];

  # Enable programs.
  programs = {
    dconf.enable = true;
  };
}