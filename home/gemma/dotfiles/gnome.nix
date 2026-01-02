{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.homeManagerModules.gnome;
in mkIf cfg.enable {
  dconf.settings = {
    "org/gnome/desktop/app-folders" = {
      folder-children = [
        "System"
        "Utility"
        "Documents"
      ];
    };
    "org/gnome/desktop/app-folders/folders/System" = {
      name = "System";
      apps = [
        "org.gnome.Terminal.desktop"
        "org.gnome.SystemMonitor.desktop"
        "org.gnome.Logs.desktop"
        "org.gnome.Settings.desktop"
        "org.gnome.baobab.desktop"
        "org.gnome.DiskUtility.desktop"
        "org.gnome.Extensions.desktop"
        "org.gnome.tweaks.desktop"
      ];
    };
    "org/gnome/desktop/app-folders/folders/Utility" = {
      name = "Utility";
      apps = [
        "htop.desktop"
        "ca.desrt.dconf-editor.desktop"
        "org.gnome.seahorse.Application.desktop"
        "protonvpn-app.desktop"
        "org.gnome.Connections.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Weather.desktop"
        "org.gnome.font-viewer.desktop"
        "org.gnome.Characters.desktop"
        "cups.desktop"
        "yelp.desktop"
      ];
    };
    "org/gnome/desktop/app-folders/folders/Documents" = {
      name = "Documents";
      apps = [
        "startcenter.desktop"
        "writer.desktop"
        "calc.desktop"
        "impress.desktop"
        "base.desktop"
        "draw.desktop"
        "math.desktop"
        "org.gnome.Evince.desktop"
        "simple-scan.desktop"
        "org.gnome.TextEditor.desktop"
      ];
    };
  };
}