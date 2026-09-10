{
  imports = [
    ./displaymanager.nix
    ./sound.nix
    ./tailscale.nix
  ];

  services = {
    printing.enable = true;
    gvfs.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
  };
}
