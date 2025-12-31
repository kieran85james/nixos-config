{
  imports = [
    ./sound.nix
    ./tailscale.nix
  ];

  services = {
    printing.enable = true;
    gvfs.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    # Automatic login
    displayManager.autoLogin = {
      enable = true;
      user = "elliot";
    };

    # Guest virtual machine services.
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };
}
