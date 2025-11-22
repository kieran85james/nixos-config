{
  imports = [
    ./sound.nix
    ./tailscale.nix
  ];

  services = {
    printing.enable = true;
    gvfs.enable = true;
  };
}
