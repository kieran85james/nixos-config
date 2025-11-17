{ pkgs, lib, inputs, outputs, ... }:

{
  imports = [
    ../common
    ../common/base
    ../common/desktop
    ../common/extraServices

    ./services
    ./packages.nix
    ./configuration.nix
    # ./secrets.nix

    ../common/users/kieran.nix
    ../common/users/gemma.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  
  nixosModules.gnome.enable = true;

  extraServices.displaylink.enable = false;
  extraServices.docker.enable = false;
}