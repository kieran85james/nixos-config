{ config, pkgs, ... }:

{
  imports = [
    ./kieran.nix

    # Conditionally include gemma.nix for specific hostnames
    (if builtins.elem config.networking.hostName [ "fsociety" "darkarmy" ] then ./gemma.nix else null)
  ];
}
