{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.coding;
in {
  options.features.desktop.coding.enable =
    mkEnableOption "install coding related stuff";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      stable.firefox
      stable.vscode
      stable.jetbrains.phpstorm
      stable.dbeaver-bin
      stable.postman
      stable.slack
      agenix-cli
    ];
  };
}
