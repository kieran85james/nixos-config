{ config, pkgs, ... }:

{
  nix = {

    settings = {
        experimental-features = [ "nix-command" "flakes" ];
        warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Remove NixOS documentation icon
  documentation.nixos.enable = false;

  # virtualisation = {
  #   docker = {
  #     enable = true;
  #     autoPrune = {
  #       enable = true;
  #       dates = "weekly";
  #     };
  #   };
  # };
}