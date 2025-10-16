{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.tailscale;
in {
  options.extraServices.tailscale.enable = mkEnableOption "enable tailscale";

  config = mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };
}
