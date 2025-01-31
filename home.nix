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
    ./home/common/desktop/gnome.nix
    ./home/common/desktop/xdg.nix
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
    "smb://ds923-plus/ DS923-PLUS"
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
