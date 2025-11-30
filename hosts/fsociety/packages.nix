{ pkgs, ... }:
{
  environment.systemPackages = (with pkgs; [
    joplin-desktop
    stable.bitwarden
    stable.google-chrome
    stable.libreoffice
    stable.spotify
    stable.authenticator
    stable.shotwell
    stable.vlc
    stable.rhythmbox
    stable.steam
    stable.ferdium
    stable.cryptomator
    stable.protonvpn-gui
    stable.php83
    stable.php83Packages.composer
    stable.php83Extensions.mbstring
    stable.mariadb
    stable.nodejs
    laravel
  ]);

  services.mysql = {
    enable = true;
    package = pkgs.stable.mariadb;
  };

  programs.npm.enable = true;
}