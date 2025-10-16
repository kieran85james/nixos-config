{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.displaylink;
in {
  options.extraServices.displaylink.enable = mkEnableOption "enable displaylink";

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ stable.displaylink ];
    services.xserver.videoDrivers = [ "displaylink" "modesetting" ];
    services.xserver.displayManager.sessionCommands = ''
      ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --output eDP-1 --off
    '';
  };
}
