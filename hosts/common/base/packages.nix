{ pkgs, unstable, ... }:
{
  environment.systemPackages = (with pkgs; [
    # agenix
    colordiff
    curl
    git
    htop
    neofetch
    p7zip
    rsync
    unrar
    unzip
    wget
    wireguard-tools
    zsh
    php83
    php83Packages.composer
    php83Extensions.mbstring
    mariadb
    nodejs
  ])

  ++
    
  (with unstable; [
    laravel
  ]);

  services.mysql = {
    enable = true;
    package = unstable.mariadb;
  };

  programs.npm.enable = true;
}