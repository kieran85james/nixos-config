{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.nixosModules.gnome;
in {
  options.nixosModules.gnome.enable = mkEnableOption "enable gnome";

  config = mkIf cfg.enable {
    # Enable the X11 windowing system.
    services = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      xserver = {
        enable = true;
        excludePackages = with pkgs; [ stable.xterm ];
      };
    };

    # Exclude GNOME packages.
    environment.gnome.excludePackages = with pkgs; [
      stable.epiphany
      stable.gnome-tour
      stable.gnome-console
      stable.gnome-maps
      stable.gnome-clocks
      stable.gnome-music
      stable.decibels
      stable.totem
    ];

    # GNOME packages.
    environment.systemPackages = with pkgs; [
      stable.gnome-boxes
      stable.gnome-terminal
      stable.gnome-tweaks
      stable.dconf-editor
      stable.gnome-online-accounts # configure settings for this!
    ];

    # Enable programs.
    programs = {
      dconf.enable = true;
    };
  };
}
