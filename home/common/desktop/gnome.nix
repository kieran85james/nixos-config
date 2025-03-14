{ config, pkgs, lib, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "google-chrome.desktop"
        "code.desktop"
        "phpstorm.desktop"
        "dbeaver.desktop"
        "slack.desktop"
        "bitwarden.desktop"
        "com.belmoussaoui.Authenticator.desktop"
        "org.gnome.Geary.desktop"
        "org.gnome.Nautilus.desktop"
        "spotify.desktop"
      ];
    };
    "org/gnome/desktop/app-folders" = {
      folder-children = [
        "System"
        "Utility"
        "Office"
      ];
    };
    "org/gnome/desktop/app-folders/folders/System" = {
      name = "System";
      apps = [
        "org.gnome.Settings.desktop"
        "gnome-system-monitor.desktop"
        "org.gnome.baobab.desktop"
        "org.gnome.DiskUtility.desktop"
        "org.gnome.Extensions.desktop"
        "org.gnome.tweaks.desktop"
        "org.gnome.Terminal.desktop"
        "org.gnome.Logs.desktop"
      ];
    };
    "org/gnome/desktop/app-folders/folders/Utility" = {
      name = "Utility";
      apps = [
        "htop.desktop"
        "ca.desrt.dconf-editor.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.Connections.desktop"
        "org.gnome.Evince.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.font-viewer.desktop"
        "simple-scan.desktop"
        "org.gnome.Totem.desktop"
        "org.gnome.Weather.desktop"
        "cups.desktop"
        "org.gnome.Characters.desktop"
        "yelp.desktop"
      ];
    };
    "org/gnome/desktop/app-folders/folders/Office" = {
      name = "Office";
      apps = [
        "startcenter.desktop"
        "writer.desktop"
        "calc.desktop"
        "impress.desktop"
        "base.desktop"
        "draw.desktop"
        "math.desktop"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
      gtk-theme = "Adwaita-dark";
    };
    "org/gnome/desktop/background" = {
      picture-options = "zoom";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      workspaces-only-on-primary = false;
      edge-tiling = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 600;
    };
    "org/gnome/desktop/screensaver" = {
      lock-enabled = true;
    };
    "org/gnome/desktop/notifications" = {
      show-in-lock-screen = false;
    };
    "org/gnome/desktop/privacy" = {
      remember-recent-files = true;
      recent-files-max-age = 30;
      remove-old-trash-files = true;
      remove-old-temp-files = true;
      old-files-age = lib.hm.gvariant.mkUint32 30;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
      night-light-schedule-from = 20.0;
      night-light-schedule-to = 7.0;
      night-light-temperature = lib.hm.gvariant.mkUint32 2700;
    };
    "org/gnome/desktop/media-handling" = {
      autorun-never = true;
    };
    "org/gnome/shell/keybindings" = {
      toggle-overview = ["<Super>"];
      toggle-application-view = ["<Super>a"];
      toggle-quick-settings = ["<Super>s"];
      
      toggle-message-tray = ["<Super>v"];
      focus-active-notification = ["<Super>n"];
      
      screenshot = ["<Shift>Print"];
      screenshot-window = ["<Alt>Print"];
      show-screenshot-ui = ["Print"];
      show-screen-recording-ui = ["<Ctrl><Shift><Alt>R"];

      switch-to-application-1 = ["<Super>1"];
      switch-to-application-2 = ["<Super>2"];
      switch-to-application-3 = ["<Super>3"];
      switch-to-application-4 = ["<Super>4"];
      switch-to-application-5 = ["<Super>5"];
      switch-to-application-6 = ["<Super>6"];
      switch-to-application-7 = ["<Super>7"];
      switch-to-application-8 = ["<Super>8"];
      switch-to-application-9 = ["<Super>9"];
    };
    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = ["<Alt>space"];

      begin-move = ["<Alt>F7"];
      begin-resize = ["<Alt>F8"];

      maximize = ["<Super>Up"];
      unmaximize = ["<Super>Down"];
      toggle-maximized = ["<Super>m"];
      minimize = ["<Super>h"];
      close = ["<Super>q"];
      show-desktop = ["<Super>d"];
      move-to-center = ["<Super>c"];

      switch-to-workspace-1 = ["<Control><Super>1"];
      switch-to-workspace-2 = ["<Control><Super>2"];
      switch-to-workspace-3 = ["<Control><Super>3"];
      switch-to-workspace-4 = ["<Control><Super>4"];
      switch-to-workspace-5 = ["<Control><Super>5"];
      switch-to-workspace-6 = ["<Control><Super>6"];
      switch-to-workspace-7 = ["<Control><Super>7"];
      switch-to-workspace-8 = ["<Control><Super>8"];
      switch-to-workspace-9 = ["<Control><Super>9"];
      switch-to-workspace-10 = ["<Control><Super>0"];
      switch-to-workspace-last = ["<Control><Super>End"];
      switch-to-workspace-left = ["<Control><Super>Left"];
      switch-to-workspace-right = ["<Control><Super>Right"];

      move-to-workspace-1 = ["<Shift><Control><Super>1"];
      move-to-workspace-2 = ["<Shift><Control><Super>2"];
      move-to-workspace-3 = ["<Shift><Control><Super>3"];
      move-to-workspace-4 = ["<Shift><Control><Super>4"];
      move-to-workspace-5 = ["<Shift><Control><Super>5"];
      move-to-workspace-6 = ["<Shift><Control><Super>6"];
      move-to-workspace-7 = ["<Shift><Control><Super>7"];
      move-to-workspace-8 = ["<Shift><Control><Super>8"];
      move-to-workspace-9 = ["<Shift><Control><Super>9"];
      move-to-workspace-10 = ["<Shift><Control><Super>0"];
      move-to-workspace-left = ["<Shift><Control><Super>Left"];
      move-to-workspace-right = ["<Shift><Control><Super>Right"];
      move-to-workspace-last = ["<Shift><Control><Super>End"];

      move-to-monitor-left = ["<Super><Shift>Left"];
      move-to-monitor-right = ["<Super><Shift>Right"];

      switch-applications = ["<Super>Tab"];
      switch-applications-backward = ["<Shift><Super>Tab"];
      cycle-windows = ["<Alt>Tab"];
      cycle-windows-backward = ["<Shift><Alt>Tab"];

      switch-group = ["<Super>Above_Tab"];
      switch-group-backward = ["<Shift><Super>Above_Tab"];
      cycle-group = ["<Alt>Above_Tab"];
      cycle-group-backward = ["<Shift><Alt>Above_Tab"];

      switch-panels = ["<Super>Escape"];
      switch-panels-backward = ["<Shift><Super>Escape"];
      cycle-panels = ["<Alt>Escape"];
      cycle-panels-backward = ["<Shift><Alt>Escape"];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Launch terminal";
      command = "gnome-terminal";
      binding = "<Super>t";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Launch file manager";
      command = "nautilus -w ${config.home.homeDirectory}";
      binding = "<Super>f";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Launch browser";
      command = "google-chrome-stable";
      binding = "<Super>b";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Launch browser (incognito)";
      command = "google-chrome-stable --incognito";
      binding = "<Shift><Super>b";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      name = "Launch text editor (GUI)";
      command = "phpstorm";
      binding = "<Super>e";
    };
  };
}