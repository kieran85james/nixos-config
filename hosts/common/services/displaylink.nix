{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    displaylink
  ];

  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --output eDP-1 --off
  '';
}