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
  ])

  ++
    
  (with unstable; [
    php84
    php84Packages.composer
    mariadb
    laravel
  ]);

  services.mysql = {
    enable = true;
    package = unstable.mariadb;
  };
}