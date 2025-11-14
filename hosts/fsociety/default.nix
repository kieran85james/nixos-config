{
  imports = [
    ../common/base
    ../common/desktop
    ../common/extraServices
    ../common/users

    ./configuration.nix
    # ./secrets.nix
    ./services
  ];
  
  extraServices.displaylink.enable = false;
  extraServices.docker.enable = false;
  extraServices.tailscale.enable = false;
}