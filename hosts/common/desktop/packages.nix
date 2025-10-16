{ pkgs, ... }:
{
  environment.systemPackages = (with pkgs; [
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
    stable.fira-mono
    stable.protonvpn-gui
    stable.qemu_full
    stable.qemu_kvm
    stable.qemu-utils
    stable.spice-gtk
    stable.spice-protocol
    stable.spice-vdagent
    # stable.gparted
    stable.php83
    stable.php83Packages.composer
    stable.php83Extensions.mbstring
    stable.mariadb
    stable.nodejs
    joplin-desktop
    laravel
  ]);

  services.mysql = {
    enable = true;
    package = pkgs.stable.mariadb;
  };

  programs.npm.enable = true;
}