{ pkgs, ... }:

{
  users.users.gemma = {
    isNormalUser = true;
    description = "Gemma Murrow";
    extraGroups = [];
    packages = with pkgs; [];
  };
}
