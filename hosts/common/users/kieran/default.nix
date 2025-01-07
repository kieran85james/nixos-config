{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kieran = {
    isNormalUser = true;
    description = "Kieran James";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      vscode
      jetbrains.phpstorm
      dbeaver-bin
      mariadb
      docker
      # postman
      slack
    ];
  };
}