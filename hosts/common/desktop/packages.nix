{ pkgs, unstable, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = (with pkgs; [
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
    ferdium
    cryptomator
    fira-mono
    # gparted
  ])

  ++

  (with unstable; [
    joplin-desktop
  ]);
}