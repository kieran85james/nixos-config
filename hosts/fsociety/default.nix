{ pkgs, lib, inputs, outputs, ... }:

{
  imports = [
    ../common
    ../common/extraServices
    ../common/users/kieran.nix
    ../common/users/gemma.nix
    inputs.home-manager.nixosModules.home-manager
    
    ./services
    ./packages.nix
    ./configuration.nix
    # ./secrets.nix
  ];
  
  nixosModules.gnome.enable = true;

  extraServices.displaylink.enable = false;
  extraServices.docker.enable = false;
  extraServices.flatpak.enable = false;
  extraServices.virtualisation.enable = false;
}