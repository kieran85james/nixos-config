{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../common/base/nixos.nix
      ../common/base/locale.nix
      ../common/base/packages.nix

      ../common/services/networkmanager.nix
      ../common/services/displaylink.nix
      ../common/services/tailscale.nix
      ../common/services/pipewire.nix
      ../common/services/cups.nix

      ../common/desktop/packages.nix
      ../common/desktop/gnome.nix

      ../common/users/kieran/default.nix
      ../common/users/gemma/default.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "darkarmy"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  virtualisation.libvirtd.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
