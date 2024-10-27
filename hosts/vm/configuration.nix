{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../common/base/nixos.nix
      ../common/base/locale.nix
      ../common/base/packages.nix

      ../common/services/networkmanager.nix
      ../common/services/pipewire.nix
      ../common/services/cups.nix
      
      # ../common/hardware/bluetooth.nix

      ../common/desktop/gnome.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "vm"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kieran = {
    isNormalUser = true;
    description = "Kieran James";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      vscode
      jetbrains.phpstorm
      dbeaver-bin
      # postman
      slack
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    bitwarden
    google-chrome
    libreoffice
    spotify
    authenticator
    shotwell
    vlc
    rhythmbox
    steam
    mariadb
    joplin-desktop
    ferdium
    docker
    cryptomator
    fira-mono
    # gparted
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}