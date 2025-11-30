{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.fonts;
in {
  options.features.desktop.fonts.enable =
    mkEnableOption "install additional fonts for desktop apps";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # font-manager
      fira-code
      fira-code-symbols
      font-awesome_5
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      noto-fonts
    ];
  };
}
