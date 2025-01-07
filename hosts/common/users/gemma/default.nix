{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gemma = {
    isNormalUser = true;
    description = "Gemma Murrow";
    extraGroups = [];
    packages = with pkgs; [];
  };
}