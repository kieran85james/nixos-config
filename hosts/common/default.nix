{
  pkgs,
  lib,
  inputs,
  outputs,
  ...
}: {
  imports = [
    outputs.nixosModules.gnome
  ];

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
  };

  nix = {
    settings = {
      trusted-users = [ "root" ];
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
  };

  # Remove NixOS documentation icon
  documentation.nixos.enable = false;
}
