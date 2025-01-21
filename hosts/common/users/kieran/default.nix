{ config, pkgs, unstable, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kieran = {
    isNormalUser = true;
    description = "Kieran James";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    packages = (with pkgs; [
      firefox
      vscode
      jetbrains.phpstorm
      dbeaver-bin
      docker
      docker-compose
      # postman
      slack
    ])
    
    ++
    
    (with unstable; [
      php84
      php84Packages.composer
      mariadb
      laravel
    ]);
  };

  services.mysql = {
    enable = true;
    package = unstable.mariadb;
  };
}