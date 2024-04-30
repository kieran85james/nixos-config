{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kieran";
  home.homeDirectory = "/home/kieran";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  imports = [
    ./home/common/sh.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kieran/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/media/music";
    videos = "${config.home.homeDirectory}/media/videos";
    pictures = "${config.home.homeDirectory}/media/pictures";
    templates = "${config.home.homeDirectory}/templates";
    download = "${config.home.homeDirectory}/downloads";
    documents = "${config.home.homeDirectory}/media/documents";
    desktop = null;
    publicShare = "${config.home.homeDirectory}/public";
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/media/books";
      XDG_PROJECTS_DIR = "${config.home.homeDirectory}/projects";
      XDG_JOBS_DIR = "${config.home.homeDirectory}/projects/jobs";
      XDG_APP_DIR = "${config.home.homeDirectory}/projects/jobs/app";
      XDG_APP_BAKS_DIR = "${config.home.homeDirectory}/projects/jobs/app/backups";
      XDG_PERSONAL_DIR = "${config.home.homeDirectory}/projects/personal";
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

  gtk.enable = true;
  gtk.gtk3.bookmarks = [
    "file:///home/kieran/downloads Downloads"
    "file:///home/kieran/media/documents Documents"
    "file:///home/kieran/media/music Music"
    "file:///home/kieran/media/pictures Pictures"
    "file:///home/kieran/media/videos Videos"
    "file:///home/kieran/projects Projects"
    "file:///home/kieran/projects/personal Personal Projects"
    "file:///home/kieran/projects/jobs/app APP Wholesale"
  ];

  programs.git = {
    enable = true;
    userName = "Kieran James";
    userEmail = "kieran85james@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    includes = [{
      condition = "gitdir:${config.home.homeDirectory}/projects/jobs/app/";
      contents = {
        user.name = "Kieran James";
        user.email = "kieran.james@appwholesaleltd.co.uk";
      };
    }];
  };

  # to enable ssh and configer .ssh/config file
  # programs.ssh.enable = true;
  # programs.ssh.matchBlocks = {
  #   "john.example.com" = {
  #     hostname = "example.com";
  #     user = "john";
  #   };
  # };

  # Gnome configs
  # dconf.enable = true;
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
    };
    "org/gnome/shell/keybindings" = {
      toggle-message-tray = ["<Super>v"];
    };
    "org/gnome/desktop/wm/keybindings" = {
      cycle-panels = ["<Super>Escape"];
      cycle-panels-backward = ["<Shift><Super>Escape"];
      close = ["<Super>q"];
      toggle-maximized = ["<Super>m"];
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
      switch-to-workspace-0 = ["<Control><Super>0"];
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
      move-to-workspace-0 = ["<Shift><Control><Super>0"];
      move-to-workspace-left = ["<Shift><Control><Super>Left"];
      move-to-workspace-right = ["<Shift><Control><Super>Right"];
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
      command = "nautilus -w /home/kieran";
      binding = "<Super>f";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Launch browser";
      command = "google-chrome";
      binding = "<Super>b";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Launch browser (incognito)";
      command = "google-chrome --incognito";
      binding = "<Shift><Super>b";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      name = "Launch text editor (GUI)";
      command = "phpstorm";
      binding = "<Super>e";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
