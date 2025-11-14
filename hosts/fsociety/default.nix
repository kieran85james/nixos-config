{
  imports = [
    ../common/base
    ../common/desktop
    ../common/extraServices

    ./configuration.nix
    # ./secrets.nix
    ./services

    ../common/users/kieran.nix
    ../common/users/gemma.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  
  extraServices.displaylink.enable = false;
  extraServices.docker.enable = false;
  extraServices.tailscale.enable = false;
}